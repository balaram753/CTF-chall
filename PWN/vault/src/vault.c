#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

static void win(void) {
    char flag[128];
    FILE *fp = fopen("flag.txt", "r");
    if (!fp) { puts("Flag unavailable."); return; }
    if (fgets(flag, sizeof(flag), fp)) {
        puts("\n[+] Vault opened!");
        printf("[+] Flag: %s", flag);
    }
    fclose(fp);
}

static void vault(void) {
    char name[32];
    int32_t code;
    int32_t bonus;
    puts("================================");
    puts("           THE VAULT");
    puts("================================\n");
    printf("Username: ");
    if (!fgets(name, sizeof(name), stdin)) exit(0);
    printf("Access code: ");
    if (scanf("%d", &code) != 1) exit(0);
    bonus = code + 0x40000000;
    if (bonus < 0) {
        puts("\n[-] Authorization failed.");
        return;
    }
    if (code == 0x13371337) {
        puts("\n[-] Nice try. That code is disabled.");
        return;
    }
    win();
}

int main(void) { setbuf(stdout, NULL); vault(); return 0; }
