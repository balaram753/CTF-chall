#include <stdio.h>
#include <stdlib.h>

static void win(void) {
    char flag[128];
    FILE *fp = fopen("flag.txt", "r");

    if (!fp) {
        puts("Flag unavailable.");
        return;
    }

    if (fgets(flag, sizeof(flag), fp)) {
        printf("\n[+] Access granted!\n");
        printf("[+] Flag: %s", flag);
    }

    fclose(fp);
}

static void echo(void) {
    char buffer[32];
    int access = 0;

    puts("================================");
    puts("        ECHOES TERMINAL");
    puts("================================");
    puts("");
    printf("Tell me something:\n> ");

    /* Intentionally vulnerable for the CTF. */
    gets(buffer);

    printf("\nYou said: %s\n", buffer);

    if (access == 0x1337) {
        win();
    } else {
        puts("\nNothing interesting happened...");
    }
}

int main(void) {
    setbuf(stdout, NULL);
    echo();
    return 0;
}
