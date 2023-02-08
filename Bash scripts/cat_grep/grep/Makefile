all: s21_grep test

s21_grep: 
		gcc -Wall -Werror -Wextra -std=c11 s21_grep.c -o s21_grep

clean:
		rm -f s21_grep grep_result.txt s21_grep_result.txt

test:
		sh grep_test.sh
