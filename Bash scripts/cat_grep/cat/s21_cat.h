#ifndef SRC_CAT_S21_CAT_H_
#define SRC_CAT_S21_CAT_H_

typedef struct flagSet {
    int b, e, n, s, t, v;
} flagSet;

void setFlags(int index, flagSet* activeFlags);
int nFlags(char* arg, flagSet* activeFlags);
int isFlag(char* str, flagSet* activeFlags);
void printFile(char* fileName, flagSet activeFlags);

#endif  // SRC_CAT_S21_CAT_H_
