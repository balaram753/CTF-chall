#include <stdio.h>
#include <string.h>

#define KEY 0x5a

static const unsigned char enc_serial[] = {
    0x14, 0x69, 0x6a, 0x14, 0x77, 0x1e, 0x6e, 0x0d, 0x14, 0x77, 0x62, 0x62
};
#define SERIAL_LEN (sizeof(enc_serial))

static const unsigned char enc_flag[] = {
    0x19, 0x0e, 0x1c, 0x21, 0x22, 0x6a, 0x28, 0x05, 0x2d, 0x32, 0x33, 0x29,
    0x2a, 0x3f, 0x28, 0x29, 0x05, 0x2e, 0x32, 0x3f, 0x05, 0x2e, 0x28, 0x2f,
    0x2e, 0x32, 0x27
};
#define FLAG_LEN (sizeof(enc_flag))

static int check_serial(const char *input) {
    if (strlen(input) != SERIAL_LEN) {
        return 0;
    }
    for (size_t i = 0; i < SERIAL_LEN; i++) {
        if ((input[i] ^ KEY) != enc_serial[i]) {
            return 0;
        }
    }
    return 1;
}

static void reveal_flag(void) {
    char flag[FLAG_LEN + 1];
    for (size_t i = 0; i < FLAG_LEN; i++) {
        flag[i] = enc_flag[i] ^ KEY;
    }
    flag[FLAG_LEN] = '\0';
    printf("%s\n", flag);
}

int main(void) {
    char input[64];

    puts("=== KEYSTONE ACTIVATION ===");
    puts("This build is unlicensed. Enter your activation code to continue.");
    printf("> ");
    fflush(stdout);

    if (!fgets(input, sizeof(input), stdin)) {
        return 1;
    }
    input[strcspn(input, "\n")] = '\0';

    if (!check_serial(input)) {
        puts("Invalid activation code.");
        return 1;
    }

    puts("Activation accepted.\n");
    reveal_flag();
    return 0;
}
