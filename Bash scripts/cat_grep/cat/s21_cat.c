#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "s21_cat.h"

int main(int argc, char** argv) {
    if (argc > 1) {
        flagSet activeFlags = {0};
        int i;
        int n = 0;
        for (i = 1; i < argc; i++) {
            if (nFlags(argv[i], &activeFlags) > 0) {
                n+=nFlags(argv[i], &activeFlags);
            }
            if (!nFlags(argv[i], &activeFlags)) {
                printFile(argv[i], activeFlags);
            }
        }
        // printf("\n\n*********************\n");
        // printf("Количество флагов: %d\n", n);
        // printf("-b flag: %s\n", activeFlags.b?"YES":"NO");
        // printf("-e flag: %s\n", activeFlags.e?"YES":"NO");
        // printf("-n flag: %s\n", activeFlags.n?"YES":"NO");
        // printf("-s flag: %s\n", activeFlags.s?"YES":"NO");
        // printf("-t flag: %s\n", activeFlags.t?"YES":"NO");
        // printf("-v flag: %s\n", activeFlags.v?"YES":"NO");
        // printf("*********************\n");
    }
    return 0;
}

void setFlags(int index, flagSet* activeFlags) {
    switch (index) {
        case 0:
        case 1:
            activeFlags->b = 1;
            break;
        case 2:
            activeFlags->e = 1;
            activeFlags->v = 1;
            break;
        case 3:
            activeFlags->e = 1;
            break;
        case 4:
        case 5:
            activeFlags->n = 1;
            break;
        case 6:
        case 7:
            activeFlags->s = 1;
            break;
        case 8:
            activeFlags->t = 1;
            activeFlags->v = 1;
            break;
        case 9:
            activeFlags->t = 1;
            break;
        case 10:
            activeFlags->v = 1;
            break;
    }
}

int nFlags(char* arg, flagSet* activeFlags) {
    int nflags = 0;
    int dash = 0;
    char* a = arg;
    while (*a) {
        if (*a == '-' && dash == 0) {
            dash = 1;
            a++;
        }
        if (dash == 1 && isFlag(a, activeFlags)) {
            nflags++;
            a+=isFlag(a, activeFlags);
            while (isFlag(a, activeFlags)) {
                nflags++;
                a+=isFlag(a, activeFlags);
            }
            dash = 0;
        }
        if (dash == 1 && !isFlag(a, activeFlags)) {
            printf("usage: cat [-beEnstTv] [file ...]\n");
            exit(1);
        }
        if (dash == 0 && *a != '-') {
            break;
        }
    }
    return nflags;
}

int isFlag(char* str, flagSet* activeFlags) {
    int result = 0;
        char flags[][20] = {
            // -b [0-1]
            "b",
            "-number-nonblank",
            // -e [2]
            "e",
            // -E [3]
            "E",
            // -n [4-5]
            "-number",
            "n",
            // -s [6-7]
            "s",
            "-squeeze-blank",
            // -t [8]
            "t",
            // -T [9]
            "T",
            // -v [10]
            "v"
        };
    for (long unsigned int i = 0; i < sizeof(flags)/sizeof(flags[0]); i++) {
        if (memcmp(flags[i], str, strlen(flags[i])) == 0) {
            setFlags(i, activeFlags);
            result = strlen(flags[i]);
            break;
        }
    }
    return result;
}

void printFile(char* fileName, flagSet activeFlags) {
    FILE* fp;
    long int stringNumber = 0;
    long int nonVoidStringNumber = 0;
    char prevC = '\n';
    char c;
    fp = fopen(fileName, "r");
    if (!fp) {
        printf("s21_cat: %s: No such file or directory\n", fileName);
        exit(1);
        }
    while (1) {
        c = fgetc(fp);
        // -b
        if (activeFlags.b && !feof(fp) && prevC == '\n' && c != '\n') {
            printf("%6.ld\t", ++nonVoidStringNumber);
        }
        // -e
        if (activeFlags.e && c == '\n') {
            putchar('$');
        }
        // -n
        if (activeFlags.n && !feof(fp) && prevC == '\n') {
            printf("%6.ld\t", ++stringNumber);
        }
        // -s
        if (activeFlags.s && prevC == '\n' && c == '\n') {
            for ( ; c == '\n';) {
                c = fgetc(fp);
            }
            putchar('\n');
        }
        // -t
        if (activeFlags.t && c == '\t') {
            putchar('^');
            c = 'I';
        }
        // -v
        if (activeFlags.v && ((c >= 0 && c < 9) || (c > 10 && c < 32) || c == 127)) {
            putchar('^');
            if (c == 127) {c = '?';} else {c+= 64;}
        }
        if (feof(fp)) {
            break;
            }
        putchar(c);
        prevC = c;
        }
    fclose(fp);
}
