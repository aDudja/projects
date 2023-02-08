all: s21_cat test

s21_cat:
		gcc -Wall -Werror -Wextra -std=c11 s21_cat.c -o s21_cat

clean:
		rm -f s21_cat cat_result.txt s21_cat_result.txt

test:
		sh cat_test.sh
