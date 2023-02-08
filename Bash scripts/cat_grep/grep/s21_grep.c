#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <regex.h>

#include "s21_grep.h"

int main(int argc, char** argv) {
    if (argc > 1) {
        flagSet flags = {0};
        int i;
        int template = 0;
        char template_str[999] = {0};
        int nfiles = 0;
        char file_name[999]  = {0};
        int n = 0;
        for (i = 1; i < argc; i++) {
            if (nFlags(argv[i]) > 0) {
                activateFlags(argv[i], &flags);
                n+=nFlags(argv[i]);
            }
            if (flags.f && nFlags(argv[i]) == 0 && !template) {
                template = 1;
                FILE* ftmp = fopen(argv[i], "r");
                if (ftmp == NULL) {
                    if (!flags.s) printf("s21_grep: %s: No such file or directory\n", argv[i]);
                    exit(EXIT_FAILURE);
                }
                fgets(template_str, 999, ftmp);
                fclose(ftmp);
                continue;
            }
            if (nFlags(argv[i]) == 0 && !template) {
                template = 1;
                strcpy(template_str, argv[i]);
                continue;
            }
            if (nFlags(argv[i]) == 0 && template) {
                if (!nfiles && i+1 < argc) nfiles = argc - i;
                strcpy(file_name, argv[i]);
                searchMatches(template_str, file_name, flags, nfiles);
            }
        }
        // printf("\n*********************\n");
        // printf("Количество флагов: %d\n", n);
        // printf("-e flag: %s\n", flags.e?"YES":"NO");
        // printf("-i flag: %s\n", flags.i?"YES":"NO");
        // printf("-v flag: %s\n", flags.v?"YES":"NO");
        // printf("-c flag: %s\n", flags.c?"YES":"NO");
        // printf("-l flag: %s\n", flags.l?"YES":"NO");
        // printf("-n flag: %s\n", flags.n?"YES":"NO");
        // printf("-h flag: %s\n", flags.h?"YES":"NO");
        // printf("-s flag: %s\n", flags.s?"YES":"NO");
        // printf("-f flag: %s\n", flags.f?"YES":"NO");
        // printf("-o flag: %s\n", flags.o?"YES":"NO");
        // printf("Шаблон в файле: %s\n", template && flags.f ? "YES" : "NO");
        // printf("Шаблон: %s\n", template_str);
        // printf("Файл: %s\n", file_name);
        // printf("*********************\n");
    }
    return 0;
}

int nFlags(char* s) {
    extern char setFlags[][10];
    int nflags = 0;
    int dash = 0;
    char* sp = s;
    while (*sp) {
        if (*sp == '-' && dash == 0) {
            dash = 1;
            sp++;
        }
        if (dash == 1 && indexFlag(sp) >=0) {
            nflags++;
            sp += strlen(setFlags[indexFlag(sp)]);
            while (indexFlag(sp) != -1) {
                nflags++;
                sp += strlen(setFlags[indexFlag(sp)]);
            }
            dash = 0;
        }
        if (dash == 1 && indexFlag(sp) == -1) {
            printf("usage: grep [-eivcln] template [file ...]\n");
            exit(1);
        }
        if (dash == 0 && *sp != '-') {
            break;
        }
    }
    return nflags;
}

int indexFlag(char* s) {
    char* sp = s;
    long unsigned int i;
    long int flagIndex = -1;
    extern char setFlags[][10];
    for (i = 0; i < sizeof(setFlags)/sizeof(setFlags[0]); i++) {
        if (memcmp(sp, setFlags[i], strlen(setFlags[i])) == 0) {
            flagIndex = i;
            break;
        }
    }
    return flagIndex;
}

void activateFlag(int flagIndex, flagSet* activeFlags) {
        switch (flagIndex) {
        case 0:
            activeFlags->e = 1;
            break;
        case 1:
            activeFlags->i = 1;
            break;
        case 2:
            activeFlags->v = 1;
            break;
        case 3:
            activeFlags->c = 1;
            break;
        case 4:
            activeFlags->l = 1;
            break;
        case 5:
            activeFlags->n = 1;
            break;
        case 6:
            activeFlags->h = 1;
            break;
        case 7:
            activeFlags->s = 1;
            break;
        case 8:
            activeFlags->f = 1;
            break;
        case 9:
            activeFlags->o = 1;
            break;
    }
}

void activateFlags(char* s, flagSet* activeFlags) {
    extern char setFlags[][10];
    int dash = 0;
    char* sp = s;
    while (*sp) {
        if (*sp == '-' && dash == 0) {
            dash = 1;
            sp++;
        }
        if (dash == 1 && indexFlag(sp) >=0) {
            activateFlag(indexFlag(sp), activeFlags);
            sp += strlen(setFlags[indexFlag(sp)]);
            while (indexFlag(sp) != -1) {
                activateFlag(indexFlag(sp), activeFlags);
                sp += strlen(setFlags[indexFlag(sp)]);
            }
            dash = 0;
        }
    }
}

void prints(char* str) {
    char* ps = str;
    fputs(str, stdout);
    if (ps[strlen(ps)-1] != '\n') putchar('\n');
}

void searchMatches(const char* pattern, const char* fileName, flagSet flags, int nfiles) {
// -e Шаблон
// -i Игнорирует различия регистра.
// -v Инвертирует смысл поиска соответствий.
// -c Выводит только количество совпадающих строк.
// -l Выводит только совпадающие файлы.
// -n Предваряет каждую строку вывода номером строки из файла ввода.
// -h Выводит совпадающие строки, не предваряя их именами файлов.
// -s Подавляет сообщения об ошибках о несуществующих или нечитаемых файлах.
// -f file Получает регулярные выражения из файла.
// -o Печатает только совпадающие (непустые) части совпавшей строки.
        int status, i;
        int cflags = REG_NEWLINE;
        regmatch_t pmatch[1];
        const size_t nmatch = 1;
        ssize_t read;
        size_t allmatch = 0;
        size_t failmatch = 0;
        regex_t reg;
        FILE* fp;
        char* line = NULL;
        char* pline = NULL;
        long int nline = 0;
        size_t len = 0;
        fp = fopen(fileName, "r");
        if (fp == NULL) {
            if (!flags.s) printf("s21_grep: %s: No such file or directory\n", fileName);
            return;
        }
        if (flags.i) cflags = REG_ICASE;
        regcomp(&reg, pattern, cflags);
        while ((read = getline(&line, &len, fp)) != -1) {
            nline++;
            status = regexec(&reg, line, nmatch, pmatch, 0);
            if (status == 0) {
                allmatch++;
                if (nfiles > 1 &&
                    !flags.l && !flags.h && !flags.v && !flags.o && !flags.c) printf("%s:", fileName);
                if (!flags.e && !flags.i && !flags.v && !flags.c && !flags.l && !flags.n &&
                    !flags.h && !flags.f && !flags.s && !flags.o) {
                    prints(line);
                    continue;
                }
                if (flags.n && !flags.v && !flags.c && !flags.l && !flags.o) {
                    printf("%ld:", nline);
                    prints(line);
                    continue;
                }
                if (flags.o && !flags.v && !flags.c && !flags.l) {
                    pline = line;
                    while (regexec(&reg, pline, nmatch, pmatch, 0)!= REG_NOMATCH) {
                        if (nfiles > 1 && !flags.h) printf("%s:", fileName);
                        if (flags.n) printf("%ld:", nline);
                        for (i = pmatch[0].rm_so; i < pmatch[0].rm_eo; ++i) {
                            putchar(pline[i]);
                        }
                        printf("\n");
                        pline+=pmatch[0].rm_eo;
                    }
                    continue;
                }
                if (!flags.v && !flags.c && !flags.l &&
                (flags.e || flags.i || flags.h || flags.s || flags.f)) {
                    prints(line);
                    continue;
                }
            }
            if (status == REG_NOMATCH) {
                failmatch++;
                if (flags.v && !flags.c && !flags.l) {
                    if (nfiles > 1 && !flags.h) printf("%s:", fileName);
                    if (flags.n) printf("%ld:", nline);
                    prints(line);
                }
            }
        }
        if (flags.c && !flags.l) {
            if (nfiles > 1 && !flags.h) printf("%s:", fileName);
            printf("%ld\n", flags.v ? failmatch : allmatch);
        }
        if ((flags.l && allmatch) || (flags.l && flags.v && failmatch)) puts(fileName);
        if (line) free(line);
        regfree(&reg);
        fclose(fp);
}
