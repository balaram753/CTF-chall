#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <sys/ptrace.h>
#include <unistd.h>

#include "ziggurat_data.h"

#define SERIAL_LEN 24

enum {
    OP_LOADW = 1, OP_LOADI, OP_MOV, OP_ADD, OP_SUB,
    OP_XOR, OP_MUL, OP_ROL, OP_ROR, OP_ADDI, OP_CMP, OP_HALT
};

static uint32_t rotl32(uint32_t x, uint32_t n) { n &= 31; return (x << n) | (x >> (32 - n)); }
static uint32_t rotr32(uint32_t x, uint32_t n) { n &= 31; return (x >> n) | (x << (32 - n)); }

/* the bytecode is stored encrypted; every fetched byte is decrypted against a
   rolling key that advances with the plaintext it just produced. no back-jumps,
   so the fetch order is the byte order. */
static size_t g_pc;
static uint32_t g_key;

static unsigned char fetch(void) {
    unsigned char c = enc_prog[g_pc++] ^ (unsigned char)(g_key & 0xff);
    g_key = g_key * 1103515245u + 12345u + c;
    return c;
}

static uint32_t fetch_imm(void) {
    uint32_t v = 0;
    v |= (uint32_t)fetch();
    v |= (uint32_t)fetch() << 8;
    v |= (uint32_t)fetch() << 16;
    v |= (uint32_t)fetch() << 24;
    return v;
}

static int vm_run(const unsigned char *input) {
    uint32_t reg[8] = {0};
    int ok = 1;

    g_pc = 0;
    g_key = VM_SEED;

    while (g_pc < ENC_PROG_LEN) {
        unsigned char op = fetch();
        switch (op) {
        case OP_LOADW: {
            unsigned char r = fetch(), idx = fetch();
            reg[r] = (uint32_t)input[idx] | ((uint32_t)input[idx+1] << 8) |
                     ((uint32_t)input[idx+2] << 16) | ((uint32_t)input[idx+3] << 24);
            break;
        }
        case OP_LOADI: { unsigned char r = fetch(); reg[r] = fetch_imm(); break; }
        case OP_MOV:   { unsigned char d = fetch(), s = fetch(); reg[d] = reg[s]; break; }
        case OP_ADD:   { unsigned char d = fetch(), s = fetch(); reg[d] += reg[s]; break; }
        case OP_SUB:   { unsigned char d = fetch(), s = fetch(); reg[d] -= reg[s]; break; }
        case OP_XOR:   { unsigned char d = fetch(), s = fetch(); reg[d] ^= reg[s]; break; }
        case OP_MUL:   { unsigned char d = fetch(), s = fetch(); reg[d] *= reg[s]; break; }
        case OP_ROL:   { unsigned char d = fetch(), n = fetch(); reg[d] = rotl32(reg[d], n); break; }
        case OP_ROR:   { unsigned char d = fetch(), n = fetch(); reg[d] = rotr32(reg[d], n); break; }
        case OP_ADDI:  { unsigned char d = fetch(); reg[d] += fetch_imm(); break; }
        case OP_CMP:   { unsigned char r = fetch(); uint32_t t = fetch_imm(); ok &= (reg[r] == t); break; }
        case OP_HALT:  return ok;
        default:       return 0;
        }
    }
    return ok;
}

/* flag key comes from the serial itself, not from any constant in the binary */
static uint64_t fnv64(const unsigned char *d, size_t n, uint64_t off, int rev) {
    uint64_t h = off;
    for (size_t i = 0; i < n; i++) {
        unsigned char b = rev ? d[n - 1 - i] : d[i];
        h ^= b;
        h *= 0x100000001B3ull;
    }
    return h;
}

static void reveal_flag(const unsigned char *serial) {
    uint64_t h0 = fnv64(serial, SERIAL_LEN, 0xCBF29CE484222325ull, 0);
    uint64_t h1 = fnv64(serial, SERIAL_LEN, 0x84222325CBF29CE4ull, 1);
    uint32_t x = (uint32_t)h0, y = (uint32_t)(h0 >> 32);
    uint32_t z = (uint32_t)h1, w = (uint32_t)(h1 >> 32);
    if ((x | y | z | w) == 0) x = 0xDEADBEEFu;

    unsigned char out[FLAG_CT_LEN + 1];
    size_t i = 0;
    while (i < FLAG_CT_LEN) {
        uint32_t t = x ^ (x << 11);
        x = y; y = z; z = w;
        w = w ^ (w >> 19) ^ t ^ (t >> 8);
        for (int b = 0; b < 4 && i < FLAG_CT_LEN; b++, i++)
            out[i] = flag_ct[i] ^ (unsigned char)(w >> (8 * b));
    }
    out[FLAG_CT_LEN] = '\0';
    printf("%s\n", out);
}

static int being_traced(void) { return ptrace(PTRACE_TRACEME, 0, 1, 0) < 0; }

static int valid_charset(const unsigned char *s, size_t n) {
    for (size_t i = 0; i < n; i++)
        if (s[i] < 0x21 || s[i] > 0x7e) return 0;
    return 1;
}

int main(void) {
    unsigned char input[64];

    if (being_traced()) { puts("the steps crumble under your gaze."); return 1; }

    puts("ZIGGURAT");
    puts("Seven steps, each sealed by the one above. Speak the rite.");
    printf("> ");
    fflush(stdout);

    char line[64];
    if (!fgets(line, sizeof(line), stdin)) return 1;
    line[strcspn(line, "\n")] = '\0';
    memset(input, 0, sizeof(input));
    memcpy(input, line, strlen(line));

    if (strlen(line) != SERIAL_LEN || !valid_charset(input, SERIAL_LEN)) {
        puts("The stones do not move.");
        return 1;
    }

    if (!vm_run(input)) {
        puts("The stones do not move.");
        return 1;
    }

    puts("The capstone lifts.\n");
    reveal_flag(input);
    return 0;
}
