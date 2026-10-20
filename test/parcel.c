#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

enum {
    EMPTY,
    REGISTERED,
    COLLECTED
};

struct parcel {
    char label[32];
    uint32_t collection_token;
    uint32_t status;
    uint32_t tracking;
};

static struct parcel desk;

static int read_line(char *out, size_t capacity)
{
    if (!fgets(out, capacity, stdin))
        return 0;

    char *newline = strchr(out, '\n');

    if (newline) {
        *newline = '\0';
    } else {
        int ch;

        while ((ch = getchar()) != '\n' && ch != EOF) {
        }
    }

    return 1;
}

static uint32_t expected_token(uint32_t tracking)
{
    uint32_t mixed = tracking ^ UINT32_C(0x6D2B79F5);

    return (mixed << 9) | (mixed >> 23);
}

static int random_tracking(uint32_t *out)
{
    FILE *fp = fopen("/dev/urandom", "rb");

    if (!fp)
        return 0;

    int ok = fread(out, sizeof *out, 1, fp) == 1;

    fclose(fp);
    return ok;
}

static void register_parcel(void)
{
    if (desk.status != EMPTY) {
        puts("The desk already holds a parcel.");
        return;
    }

    printf("Recipient label: ");

    if (!read_line(desk.label, sizeof desk.label))
        return;

    if (!random_tracking(&desk.tracking)) {
        puts("Tracking service unavailable.");
        return;
    }

    desk.collection_token =
        expected_token(desk.tracking) ^ UINT32_C(1);

    desk.status = REGISTERED;

    puts("Parcel registered.");
}

static void rename_parcel(void)
{
    if (desk.status != REGISTERED) {
        puts("No parcel waiting.");
        return;
    }

    printf("New label: ");

    if (read_line(desk.label, sizeof desk.label))
        puts("Label updated.");
}

static void print_label(void)
{
    if (desk.status != REGISTERED) {
        puts("No parcel waiting.");
        return;
    }

    printf("Recipient: %s\n", desk.label);
    puts("Collection: awaiting authorization.");
}

static void collect_parcel(void)
{
    if (desk.status != REGISTERED) {
        puts("No parcel waiting.");
        return;
    }

    if (desk.collection_token != expected_token(desk.tracking)) {
        puts("Collection denied.");
        return;
    }

    desk.status = COLLECTED;

    puts("Collection authorized. Flag delivery is not connected yet.");
}

int main(void)
{
    char input[32];

    setvbuf(stdout, NULL, _IONBF, 0);

    /* Organizer diagnostic: remove before distributing the binary. */
    printf(
        "Layout: label=%zu token=%zu status=%zu tracking=%zu size=%zu\n",
        offsetof(struct parcel, label),
        offsetof(struct parcel, collection_token),
        offsetof(struct parcel, status),
        offsetof(struct parcel, tracking),
        sizeof(struct parcel)
    );

    for (;;) {
        puts("\nPARCEL DESK");
        puts("1. Register parcel");
        puts("2. Rename parcel");
        puts("3. Print shipping label");
        puts("4. Collect parcel");
        puts("5. Exit");
        printf("> ");

        if (!read_line(input, sizeof input))
            break;

        if (strcmp(input, "1") == 0) {
            register_parcel();
        } else if (strcmp(input, "2") == 0) {
            rename_parcel();
        } else if (strcmp(input, "3") == 0) {
            print_label();
        } else if (strcmp(input, "4") == 0) {
            collect_parcel();
        } else if (strcmp(input, "5") == 0) {
            break;
        } else {
            puts("Choose 1 through 5.");
        }
    }

    return 0;
}