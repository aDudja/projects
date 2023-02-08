gcc -Wall -Werror -Wextra -std=c11 s21_cat.c -o s21_cat

TESTNAME="s21_cat test #1"
cat test1.txt > cat_result.txt
./s21_cat test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -b test #2"
cat -b test1.txt > cat_result.txt
./s21_cat -b test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -e test #3"
cat -e test1.txt > cat_result.txt
./s21_cat -e test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -n test #4"
cat -n test1.txt > cat_result.txt
./s21_cat -n test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -s test #5"
cat -s test1.txt > cat_result.txt
./s21_cat -s test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -t test #6"
cat -t test1.txt > cat_result.txt
./s21_cat -t test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -v test #7"
cat -v test1.txt > cat_result.txt
./s21_cat -v test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat test #8"
cat test1.txt > cat_result.txt
./s21_cat test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -sv test #12"
cat -sv test1.txt > cat_result.txt
./s21_cat -sv test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -n --number test #13"
cat -n test1.txt > cat_result.txt
./s21_cat --number test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -s --squeeze-blank test #14"
cat -s test1.txt > cat_result.txt
./s21_cat --squeeze-blank test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -b --number-nonblank test #15"
cat -b test1.txt > cat_result.txt
./s21_cat --number-nonblank test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -t -Tv test #16"
cat -t test1.txt > cat_result.txt
./s21_cat -Tv test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -t -T-v test #17"
cat -t test1.txt > cat_result.txt
./s21_cat -T-v test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -t -T -v test #18"
cat -t test1.txt > cat_result.txt
./s21_cat -T -v test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -e -Ev test #19"
cat -e test1.txt > cat_result.txt
./s21_cat -Ev test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -e -E-v test #20"
cat -e test1.txt > cat_result.txt
./s21_cat -E-v test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_cat -e -E -v test #21"
cat -e test1.txt > cat_result.txt
./s21_cat -E -v test1.txt > s21_cat_result.txt
cmp cat_result.txt s21_cat_result.txt || echo ">>> ${TESTNAME} : FAILED"

echo "Tests s21_cat are finished."
