#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_

typedef struct flagSet {
    int e, i, v, c, l, n, h, s, f, o;
} flagSet;

char setFlags[][10] = {"e", "i", "v", "c", "l", "n", "h", "s", "f", "o"};

int nFlags(char* s);
int indexFlag(char* s);
void activateFlag(int flagIndex, flagSet* activeFlags);
void activateFlags(char* s, flagSet* activeFlags);
void searchMatches(const char* pattern, const char* fileName, flagSet flags, int nfiles);
void prints(char* str);

#endif  // SRC_GREP_S21_GREP_H_
