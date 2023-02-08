CC=gcc
FLAGS=-Wall -Werror -Wextra
#M1=arch -x86_64
#UBUNTU=-lsubunit -lm
#DEBUG=-g

all: test

clean: 
	rm -f *.o *.a *.css *.html *.gcno *.gcda *.gcov tests s21_matrix_test.c log.txt

s21_matrix.a: s21_matrix.o
	$(M1) ar rc s21_matrix.a s21_matrix.o

s21_matrix.o: s21_matrix.c
	$(M1) $(CC) $(FLAGS) $(DEBUG) -std=c11 -c s21_matrix.c
	
s21_matrix_test.o: s21_matrix_test.check 
	$(M1) checkmk s21_matrix_test.check > s21_matrix_test.c
	$(M1) $(CC) $(FLAGS) $(DEBUG) -c s21_matrix_test.c

test: s21_matrix.a s21_matrix_test.o
	$(M1) $(CC) $(FLAGS) s21_matrix_test.o s21_matrix.a -o tests -lcheck $(UBUNTU)
	./tests

gcov_report: s21_matrix_test.o
	$(M1) $(CC) $(FLAGS) -c -fprofile-arcs -ftest-coverage s21_matrix.c
	$(M1) $(CC) $(FLAGS) -fprofile-arcs *.o -o tests -lcheck $(UBUNTU)
	./tests
	gcovr -r . --html --html-details -o coverage_report.html
	rm *.o

valgrind:
	rm -f ./log.txt
	valgrind --leak-check=full --show-leak-kinds=all -s --log-file="./log.txt" --show-reachable=no ./tests

clang-format: ../materials/linters/.clang-format
	mv ../materials/linters/.clang-format ./
	clang-format -i *.c
	clang-format -n *.c
	mv ./.clang-format ../materials/linters/
