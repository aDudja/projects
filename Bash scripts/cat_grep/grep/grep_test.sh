gcc -Wall -Werror -Wextra -std=c11 s21_grep.c -o s21_grep

#s21_grep basic tests

TESTNAME="s21_grep basic test #1"
grep '^[a-z]' test1.txt > grep_result.txt
./s21_grep '^[a-z]' test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep basic test #2"
grep '^[A-Z]' test1.txt > grep_result.txt
./s21_grep '^[A-Z]' test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep basic test #3"
grep '[a-z]$' test1.txt > grep_result.txt
./s21_grep '[a-z]$' test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep basic test #4"
grep '[a-z]$' test1.txt test2.txt > grep_result.txt
./s21_grep '[a-z]$' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep basic test #5"
grep in test1.txt test2.txt > grep_result.txt
./s21_grep in test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

#s21_grep -e tests

TESTNAME="s21_grep -e test #1"
grep -e '[a-z]$' test1.txt > grep_result.txt
./s21_grep -e '[a-z]$' test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -e test #1"
grep -e '[a-z]$' test1.txt test2.txt > grep_result.txt
./s21_grep -e '[a-z]$' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

#s21_grep -i tests

TESTNAME="s21_grep -i test #1"
grep -i '^McDonald' test1.txt > grep_result.txt
./s21_grep -i '^McDonald' test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -i test #2"
grep -i mcdonald test1.txt > grep_result.txt
./s21_grep -i mcdonald test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -i test #3"
grep -i rus test1.txt > grep_result.txt
./s21_grep -i rus test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -i test #4"
grep -i rus test1.txt test2.txt > grep_result.txt
./s21_grep -i rus test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

#s21_grep -v tests

TESTNAME="s21_grep -v test #1"
grep -v 2026 test2.txt > grep_result.txt
./s21_grep -v 2026 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -v test #2"
grep -v 'Hello world' test2.txt > grep_result.txt
./s21_grep -v 'Hello world' test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -v test #3"
grep -v '2022' test2.txt > grep_result.txt
./s21_grep -v '2022' test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -v test #4"
grep -v '2022' test1.txt test2.txt > grep_result.txt
./s21_grep -v '2022' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

#s21_grep -c tests

TESTNAME="s21_grep -c test #1"
grep -c McDonald test1.txt > grep_result.txt
./s21_grep -c McDonald test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -c test #2"
grep -c aboba test1.txt > grep_result.txt
./s21_grep -c aboba test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -c test #3"
grep -c aboba test1.txt test2.txt > grep_result.txt
./s21_grep -c aboba test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

#s21_grep -l tests

TESTNAME="s21_grep -l test #1"
grep -l McDonald test1.txt > grep_result.txt
./s21_grep -l McDonald test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -l test #2"
grep -l McDonald test1.txt > grep_result.txt
./s21_grep -l McDonald test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -l test #3"
grep -l 2022 test1.txt test2.txt > grep_result.txt
./s21_grep -l 2022 test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -l test #4"
grep -l "unclear.$" test1.txt test2.txt > grep_result.txt
./s21_grep -l "unclear.$" test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -l test #5"
grep -l "NO$" test1.txt test2.txt > grep_result.txt
./s21_grep -l "NO$" test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -l test #6"
grep -l "!$" test1.txt test2.txt > grep_result.txt
./s21_grep -l "!$" test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

#s21_grep -n tests

TESTNAME="s21_grep -n test #1"
grep -n in test1.txt > grep_result.txt
./s21_grep -n in test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -n test #2"
grep -n in test1.txt > grep_result.txt
./s21_grep -n in test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -n test #3"
grep -n in test1.txt test2.txt > grep_result.txt
./s21_grep -n in test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -n test #4"
grep -n McDonald test1.txt test2.txt > grep_result.txt
./s21_grep -n McDonald test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -n test #5"
grep -n in test1.txt test2.txt > grep_result.txt
./s21_grep -n in test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# #s21_grep -h tests

TESTNAME="s21_grep -h test #1"
grep -h in test1.txt > grep_result.txt
./s21_grep -h in test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -h test #2"
grep -h in test1.txt test2.txt > grep_result.txt
./s21_grep -h in test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -h test #3"
grep -h go test1.txt test2.txt > grep_result.txt
./s21_grep -h go test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -h test #4"
grep -h '^Goodbye' test1.txt test2.txt > grep_result.txt
./s21_grep -h '^Goodbye' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -s tests

TESTNAME="s21_grep -s test #1"
grep -s in test1.txt > grep_result.txt
./s21_grep -s in test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -s test #2"
grep -s sffsd test1.txt test2.txt > grep_result.txt
./s21_grep -s sffsd test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -s test #3"
grep -s McDonald nofile1.txt nofile2.txt > grep_result.txt
./s21_grep -s McDonald nofile1.txt nofile2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -s test #4"
grep -s McDonald test1.txt nofile2.txt > grep_result.txt
./s21_grep -s McDonald test1.txt nofile2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -f tests

TESTNAME="s21_grep -f test #1"
grep -f reg.txt test2.txt > grep_result.txt
./s21_grep -f reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -f test #2"
grep -f reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -f reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -o tests

TESTNAME="s21_grep -o test #1"
grep -o hi test2.txt > grep_result.txt
./s21_grep -o hi test2.txt > s21_grep_result.txt

TESTNAME="s21_grep -o test #2"
grep -o School test2.txt > grep_result.txt
./s21_grep -o School test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -iv tests

TESTNAME="s21_grep -iv test #1"
grep -iv SCHOOL test2.txt > grep_result.txt
./s21_grep -iv SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -iv test #2"
grep -i -v SCHOOL test2.txt > grep_result.txt
./s21_grep -i -v SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -iv test #3"
grep -i -v MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -i -v MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -in tests

TESTNAME="s21_grep -in test #1"
grep -in SCHOOL test2.txt > grep_result.txt
./s21_grep -in SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -in test #2"
grep -ni SCHOOL test2.txt > grep_result.txt
./s21_grep -ni SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -in test #3"
grep -in MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -in MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -in test #4"
grep -in '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -in '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ic tests

TESTNAME="s21_grep -ic test #1"
grep -ic SCHOOL test2.txt > grep_result.txt
./s21_grep -ic SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ic test #2"
grep -ci SCHOOL test2.txt > grep_result.txt
./s21_grep -ci SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ic test #3"
grep -ic MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -ic MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ic test #4"
grep -ic '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -ic '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -il tests

TESTNAME="s21_grep -il test #1"
grep -il SCHOOL test2.txt > grep_result.txt
./s21_grep -il SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -il test #2"
grep -li SCHOOL test2.txt > grep_result.txt
./s21_grep -li SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ic test #3"
grep -il MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -il MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ic test #4"
grep -il '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -il '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ih tests

TESTNAME="s21_grep -ih test #1"
grep -ih SCHOOL test2.txt > grep_result.txt
./s21_grep -ih SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hi test #2"
grep -hi SCHOOL test2.txt > grep_result.txt
./s21_grep -hi SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ih test #3"
grep -ih MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -ih MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ih test #4"
grep -ih '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -ih '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -is tests

TESTNAME="s21_grep -is test #1"
grep -is in test1.txt > grep_result.txt
./s21_grep -is in test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -is test #2"
grep -is sffsd test1.txt test2.txt > grep_result.txt
./s21_grep -is sffsd test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -is test #3"
grep -is McDonald nofile1.txt nofile2.txt > grep_result.txt
./s21_grep -is McDonald nofile1.txt nofile2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -is test #4"
grep -is McDonald test1.txt nofile2.txt > grep_result.txt
./s21_grep -is McDonald test1.txt nofile2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -if tests

TESTNAME="s21_grep -if test #1"
grep -if reg.txt test2.txt > grep_result.txt
./s21_grep -if reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -if test #2"
grep -if reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -if reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -io tests

TESTNAME="s21_grep -io test #1"
grep -io hi test2.txt > grep_result.txt
./s21_grep -io hi test2.txt > s21_grep_result.txt

TESTNAME="s21_grep -io test #2"
grep -io School test2.txt > grep_result.txt
./s21_grep -io School test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ie tests

TESTNAME="s21_grep -is test #1"
grep -ie in test1.txt > grep_result.txt
./s21_grep -ie in test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -is test #2"
grep -ie sffsd test1.txt test2.txt > grep_result.txt
./s21_grep -ie sffsd test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -is test #3"
grep -ie McDonald test1.txt test2.txt > grep_result.txt
./s21_grep -ie McDonald test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ie test #4"
grep -ie McDonald test1.txt test2.txt > grep_result.txt
./s21_grep -ie McDonald test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ve tests

TESTNAME="s21_grep -ve test #1"
grep -ve in test1.txt > grep_result.txt
./s21_grep -ve in test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ve test #2"
grep -ve sffsd test1.txt test2.txt > grep_result.txt
./s21_grep -ve sffsd test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ve test #3"
grep -ve McDonald test1.txt test2.txt > grep_result.txt
./s21_grep -ve McDonald test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ve test #4"
grep -ve McDonald test1.txt test2.txt > grep_result.txt
./s21_grep -ve McDonald test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -vi tests

TESTNAME="s21_grep -vi test #1"
grep -vi SCHOOL test2.txt > grep_result.txt
./s21_grep -vi SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vi test #2"
grep -vi SCHOOL test2.txt > grep_result.txt
./s21_grep -vi SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vi test #3"
grep -vi MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -vi MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vi test #4"
grep -vi '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -vi '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -vc tests

TESTNAME="s21_grep -vc test #1"
grep -vc SCHOOL test2.txt > grep_result.txt
./s21_grep -vc SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vc test #2"
grep -vc SCHOOL test2.txt > grep_result.txt
./s21_grep -vc SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vc test #3"
grep -vc MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -vc MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vc test #4"
grep -vc '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -vc '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -vl tests

TESTNAME="s21_grep -vl test #1"
grep -vl SCHOOL test2.txt > grep_result.txt
./s21_grep -vl SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vl test #2"
grep -vl SCHOOL test2.txt > grep_result.txt
./s21_grep -vl SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vl test #3"
grep -vl MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -vl MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vl test #4"
grep -vl '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -vl '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -vn tests

TESTNAME="s21_grep -vn test #1"
grep -vn School-21 test2.txt > grep_result.txt
./s21_grep -vn School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vn test #2"
grep -vn SCHOOL test2.txt > grep_result.txt
./s21_grep -vn SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vn test #3"
grep -vn SCHOOL test2.txt > grep_result.txt
./s21_grep -vn SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vn test #4"
grep -vn MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -vn MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vn test #5"
grep -vn '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -vn '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -vh tests

TESTNAME="s21_grep -vh test #1"
grep -vh School-21 test2.txt > grep_result.txt
./s21_grep -vh School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vh test #2"
grep -vh SCHOOL test2.txt > grep_result.txt
./s21_grep -vh SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vh test #3"
grep -vh SCHOOL test2.txt > grep_result.txt
./s21_grep -vh SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vh test #4"
grep -vh MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -vh MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vh test #5"
grep -vh '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -vh '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -vs tests

TESTNAME="s21_grep -vs test #1"
grep -vs in test1.txt > grep_result.txt
./s21_grep -vs in test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vs test #2"
grep -vs sffsd test1.txt test2.txt > grep_result.txt
./s21_grep -vs sffsd test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vs test #3"
grep -vs McDonald nofile1.txt nofile2.txt > grep_result.txt
./s21_grep -vs McDonald nofile1.txt nofile2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vs test #4"
grep -vs McDonald test1.txt nofile2.txt > grep_result.txt
./s21_grep -vs McDonald test1.txt nofile2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -vf tests

TESTNAME="s21_grep -vf test #1"
grep -vf reg.txt test2.txt > grep_result.txt
./s21_grep -vf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -vf test #2"
grep -vf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -vf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ce tests

TESTNAME="s21_grep -ce test #1"
grep -ce School-21 test2.txt > grep_result.txt
./s21_grep -ce School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ce test #2"
grep -ce SCHOOL test2.txt > grep_result.txt
./s21_grep -ce SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ce test #3"
grep -ce SCHOOL test2.txt > grep_result.txt
./s21_grep -ce SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ce test #4"
grep -ce MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -ce MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ce test #5"
grep -ce '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -ce '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ci tests

TESTNAME="s21_grep -ci test #1"
grep -ci School-21 test2.txt > grep_result.txt
./s21_grep -ci School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ci test #2"
grep -ci SCHOOL test2.txt > grep_result.txt
./s21_grep -ci SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ci test #3"
grep -ci SCHOOL test2.txt > grep_result.txt
./s21_grep -ci SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ci test #4"
grep -ci MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -ci MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ci test #5"
grep -ci '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -ci '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -cv tests

TESTNAME="s21_grep -cv test #1"
grep -cv School-21 test2.txt > grep_result.txt
./s21_grep -cv School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cv test #2"
grep -cv SCHOOL test2.txt > grep_result.txt
./s21_grep -cv SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cv test #3"
grep -cv SCHOOL test2.txt > grep_result.txt
./s21_grep -cv SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cv test #4"
grep -cv MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -cv MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cv test #5"
grep -cv '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -cv '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -cn tests

TESTNAME="s21_grep -cn test #1"
grep -cn School-21 test2.txt > grep_result.txt
./s21_grep -cn School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cn test #2"
grep -cn SCHOOL test2.txt > grep_result.txt
./s21_grep -cn SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cn test #3"
grep -cn SCHOOL test2.txt > grep_result.txt
./s21_grep -cn SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cn test #4"
grep -cn MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -cn MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cn test #5"
grep -cn '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -cn '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ch tests

TESTNAME="s21_grep -ch test #1"
grep -ch School-21 test2.txt > grep_result.txt
./s21_grep -ch School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ch test #2"
grep -ch SCHOOL test2.txt > grep_result.txt
./s21_grep -ch SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ch test #3"
grep -ch SCHOOL test2.txt > grep_result.txt
./s21_grep -ch SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ch test #4"
grep -ch MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -ch MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ch test #5"
grep -ch '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -ch '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -cs tests

TESTNAME="s21_grep -vs test #1"
grep -cs in test1.txt > grep_result.txt
./s21_grep -cs in test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cs test #2"
grep -cs sffsd test1.txt test2.txt > grep_result.txt
./s21_grep -cs sffsd test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cs test #3"
grep -cs McDonald nofile1.txt nofile2.txt > grep_result.txt
./s21_grep -cs McDonald nofile1.txt nofile2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cs test #4"
grep -cs McDonald test1.txt nofile2.txt > grep_result.txt
./s21_grep -cs McDonald test1.txt nofile2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -cf tests

TESTNAME="s21_grep -cf test #1"
grep -cf reg.txt test2.txt > grep_result.txt
./s21_grep -cf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cf test #2"
grep -cf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -cf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -co tests

TESTNAME="s21_grep -co test #1"
grep -co School-21 test2.txt > grep_result.txt
./s21_grep -co School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -co test #2"
grep -co SCHOOL test2.txt > grep_result.txt
./s21_grep -co SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -co test #3"
grep -co SCHOOL test2.txt > grep_result.txt
./s21_grep -co SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -co test #4"
grep -co MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -co MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -co test #5"
grep -co '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -co '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -le tests

TESTNAME="s21_grep -le test #1"
grep -le School-21 test2.txt > grep_result.txt
./s21_grep -le School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -le test #2"
grep -le SCHOOL test2.txt > grep_result.txt
./s21_grep -le SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -le test #3"
grep -le SCHOOL test2.txt > grep_result.txt
./s21_grep -le SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -le test #4"
grep -le MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -le MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -le test #5"
grep -le '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -le '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -li tests

TESTNAME="s21_grep -li test #1"
grep -li School-21 test2.txt > grep_result.txt
./s21_grep -li School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -li test #2"
grep -li SCHOOL test2.txt > grep_result.txt
./s21_grep -li SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -li test #3"
grep -li SCHOOL test2.txt > grep_result.txt
./s21_grep -li SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -li test #4"
grep -li MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -li MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -li test #5"
grep -li '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -li '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -lv tests

TESTNAME="s21_grep -lv test #1"
grep -lv School-21 test2.txt > grep_result.txt
./s21_grep -lv School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lv test #2"
grep -lv SCHOOL test2.txt > grep_result.txt
./s21_grep -lv SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lv test #3"
grep -lv SCHOOL test2.txt > grep_result.txt
./s21_grep -lv SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lv test #4"
grep -lv MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -lv MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lv test #5"
grep -lv '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -lv '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ln tests

TESTNAME="s21_grep -ln test #1"
grep -ln School-21 test2.txt > grep_result.txt
./s21_grep -ln School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ln test #2"
grep -ln SCHOOL test2.txt > grep_result.txt
./s21_grep -ln SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ln test #3"
grep -ln SCHOOL test2.txt > grep_result.txt
./s21_grep -ln SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ln test #4"
grep -ln MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -ln MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ln test #5"
grep -ln '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -ln '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -lh tests

TESTNAME="s21_grep -lh test #1"
grep -lh School-21 test2.txt > grep_result.txt
./s21_grep -lh School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lh test #2"
grep -lh SCHOOL test2.txt > grep_result.txt
./s21_grep -lh SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lh test #3"
grep -lh SCHOOL test2.txt > grep_result.txt
./s21_grep -lh SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lh test #4"
grep -lh MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -lh MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lh test #5"
grep -lh '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -lh '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ls tests

TESTNAME="s21_grep -ls test #1"
grep -ls in test1.txt > grep_result.txt
./s21_grep -ls in test1.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ls test #2"
grep -ls sffsd test1.txt test2.txt > grep_result.txt
./s21_grep -ls sffsd test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ls test #3"
grep -ls McDonald nofile1.txt nofile2.txt > grep_result.txt
./s21_grep -ls McDonald nofile1.txt nofile2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ls test #4"
grep -ls McDonald test1.txt nofile2.txt > grep_result.txt
./s21_grep -ls McDonald test1.txt nofile2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -lf tests

TESTNAME="s21_grep -lf test #1"
grep -lf reg.txt test2.txt > grep_result.txt
./s21_grep -lf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lf test #2"
grep -lf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -lf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -lo tests

TESTNAME="s21_grep -lo test #1"
grep -lo School-21 test2.txt > grep_result.txt
./s21_grep -lo School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lo test #2"
grep -lo SCHOOL test2.txt > grep_result.txt
./s21_grep -lo SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lo test #3"
grep -lo SCHOOL test2.txt > grep_result.txt
./s21_grep -lo SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lo test #4"
grep -lo MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -lo MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lo test #5"
grep -lo '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -lo '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ne tests

TESTNAME="s21_grep -ne test #1"
grep -ne School-21 test2.txt > grep_result.txt
./s21_grep -ne School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ne test #2"
grep -ne SCHOOL test2.txt > grep_result.txt
./s21_grep -ne SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ne test #3"
grep -ne SCHOOL test2.txt > grep_result.txt
./s21_grep -ne SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ne test #4"
grep -ne MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -ne MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ne test #5"
grep -ne '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -ne '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ni tests

TESTNAME="s21_grep -ni test #1"
grep -ni School-21 test2.txt > grep_result.txt
./s21_grep -ni School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ni test #2"
grep -ni SCHOOL test2.txt > grep_result.txt
./s21_grep -ni SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ni test #3"
grep -ni SCHOOL test2.txt > grep_result.txt
./s21_grep -ni SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ni test #4"
grep -ni MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -ni MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ni test #5"
grep -ni '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -ni '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -nv tests

TESTNAME="s21_grep -nv test #1"
grep -nv School-21 test2.txt > grep_result.txt
./s21_grep -nv School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nv test #2"
grep -nv SCHOOL test2.txt > grep_result.txt
./s21_grep -nv SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nv test #3"
grep -nv SCHOOL test2.txt > grep_result.txt
./s21_grep -nv SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nv test #4"
grep -nv MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -nv MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nv test #5"
grep -nv '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -nv '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -nc tests

TESTNAME="s21_grep -nc test #1"
grep -nc School-21 test2.txt > grep_result.txt
./s21_grep -nc School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nc test #2"
grep -nc SCHOOL test2.txt > grep_result.txt
./s21_grep -nc SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nc test #3"
grep -nc SCHOOL test2.txt > grep_result.txt
./s21_grep -nc SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nc test #4"
grep -nc MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -nc MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nc test #5"
grep -nc '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -nc '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -nl tests

TESTNAME="s21_grep -nl test #1"
grep -nl School-21 test2.txt > grep_result.txt
./s21_grep -nl School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nl test #2"
grep -nl SCHOOL test2.txt > grep_result.txt
./s21_grep -nl SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nl test #3"
grep -nl SCHOOL test2.txt > grep_result.txt
./s21_grep -nl SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nl test #4"
grep -nl MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -nl MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nl test #5"
grep -nl '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -nl '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -nh tests

TESTNAME="s21_grep -nh test #1"
grep -nh School-21 test2.txt > grep_result.txt
./s21_grep -nh School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nh test #2"
grep -nh SCHOOL test2.txt > grep_result.txt
./s21_grep -nh SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nh test #3"
grep -nh SCHOOL test2.txt > grep_result.txt
./s21_grep -nh SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nh test #4"
grep -nh MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -nh MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nh test #5"
grep -nh '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -nh '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ns tests

TESTNAME="s21_grep -ns test #1"
grep -ns School-21 test2.txt > grep_result.txt
./s21_grep -ns School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ns test #2"
grep -ns SCHOOL test2.txt > grep_result.txt
./s21_grep -ns SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ns test #3"
grep -ns SCHOOL notest2.txt > grep_result.txt
./s21_grep -ns SCHOOL notest2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ns test #4"
grep -ns MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -ns MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ns test #5"
grep -ns '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -ns '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -nf tests

TESTNAME="s21_grep -nf test #1"
grep -nf reg.txt test2.txt > grep_result.txt
./s21_grep -nf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nf test #2"
grep -nf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -nf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -no tests

TESTNAME="s21_grep -no test #1"
grep -no School-21 test2.txt > grep_result.txt
./s21_grep -no School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -no test #2"
grep -no SCHOOL test2.txt > grep_result.txt
./s21_grep -no SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -no test #3"
grep -no SCHOOL test2.txt > grep_result.txt
./s21_grep -no SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -no test #4"
grep -no MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -no MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -he tests

TESTNAME="s21_grep -he test #1"
grep -he School-21 test2.txt > grep_result.txt
./s21_grep -he School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -he test #2"
grep -he SCHOOL test2.txt > grep_result.txt
./s21_grep -he SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -he test #3"
grep -he SCHOOL test2.txt > grep_result.txt
./s21_grep -he SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -he test #4"
grep -he MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -he MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -he test #5"
grep -he '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -he '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -hi tests

TESTNAME="s21_grep -hi test #1"
grep -hi School-21 test2.txt > grep_result.txt
./s21_grep -hi School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hi test #2"
grep -hi SCHOOL test2.txt > grep_result.txt
./s21_grep -hi SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hi test #3"
grep -hi SCHOOL test2.txt > grep_result.txt
./s21_grep -hi SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hi test #4"
grep -hi MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -hi MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hi test #5"
grep -hi '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -hi '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -hv tests

TESTNAME="s21_grep -hv test #1"
grep -hv School-21 test2.txt > grep_result.txt
./s21_grep -hv School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hv test #2"
grep -hv SCHOOL test2.txt > grep_result.txt
./s21_grep -hv SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hv test #3"
grep -hv SCHOOL test2.txt > grep_result.txt
./s21_grep -hv SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hv test #4"
grep -hv MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -hv MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hv test #5"
grep -hv '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -hv '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -hc tests

TESTNAME="s21_grep -hc test #1"
grep -hc School-21 test2.txt > grep_result.txt
./s21_grep -hc School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hc test #2"
grep -hc SCHOOL test2.txt > grep_result.txt
./s21_grep -hc SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hc test #3"
grep -hc SCHOOL test2.txt > grep_result.txt
./s21_grep -hc SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hc test #4"
grep -hc MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -hc MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hc test #5"
grep -hc '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -hc '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -hl tests

TESTNAME="s21_grep -hl test #1"
grep -hl School-21 test2.txt > grep_result.txt
./s21_grep -hl School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hl test #2"
grep -hl SCHOOL test2.txt > grep_result.txt
./s21_grep -hl SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hl test #3"
grep -hl SCHOOL test2.txt > grep_result.txt
./s21_grep -hl SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hl test #4"
grep -hl MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -hl MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hl test #5"
grep -hl '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -hl '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -hn tests

TESTNAME="s21_grep -hn test #1"
grep -hn School-21 test2.txt > grep_result.txt
./s21_grep -hn School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hn test #2"
grep -hn SCHOOL test2.txt > grep_result.txt
./s21_grep -hn SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hn test #3"
grep -hn SCHOOL test2.txt > grep_result.txt
./s21_grep -hn SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hn test #4"
grep -hn MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -hn MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hn test #5"
grep -hn '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -hn '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -hs tests

TESTNAME="s21_grep -hs test #1"
grep -hs School-21 test2.txt > grep_result.txt
./s21_grep -hs School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hs test #2"
grep -hs SCHOOL notest2.txt > grep_result.txt
./s21_grep -hs SCHOOL notest2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hs test #3"
grep -hs SCHOOL test2.txt > grep_result.txt
./s21_grep -hs SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hs test #4"
grep -hs MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -hs MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hs test #5"
grep -hs '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -hs '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -hf tests

TESTNAME="s21_grep -hf test #1"
grep -hf reg.txt test2.txt > grep_result.txt
./s21_grep -hf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hf test #2"
grep -hf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -hf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ho tests

TESTNAME="s21_grep -ho test #1"
grep -ho School-21 test2.txt > grep_result.txt
./s21_grep -ho School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ho test #2"
grep -ho SCHOOL test2.txt > grep_result.txt
./s21_grep -ho SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ho test #3"
grep -ho SCHOOL test2.txt > grep_result.txt
./s21_grep -ho SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ho test #4"
grep -ho MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -ho MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ho test #5"
grep -ho '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -ho '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -se tests

TESTNAME="s21_grep -se test #1"
grep -se School-21 test2.txt > grep_result.txt
./s21_grep -se School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -se test #2"
grep -se SCHOOL test2.txt > grep_result.txt
./s21_grep -se SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -se test #3"
grep -se SCHOOL test2.txt > grep_result.txt
./s21_grep -se SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -se test #4"
grep -se MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -se MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -se test #5"
grep -se '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -se '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -si tests

TESTNAME="s21_grep -si test #1"
grep -si School-21 test2.txt > grep_result.txt
./s21_grep -si School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -si test #2"
grep -si SCHOOL test2.txt > grep_result.txt
./s21_grep -si SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -si test #3"
grep -si SCHOOL test2.txt > grep_result.txt
./s21_grep -si SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -si test #4"
grep -si MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -si MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -si test #5"
grep -si '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -si '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -sv tests

TESTNAME="s21_grep -sv test #1"
grep -sv School-21 test2.txt > grep_result.txt
./s21_grep -sv School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sv test #2"
grep -sv SCHOOL test2.txt > grep_result.txt
./s21_grep -sv SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sv test #3"
grep -sv SCHOOL test2.txt > grep_result.txt
./s21_grep -sv SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sv test #4"
grep -sv MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -sv MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sv test #5"
grep -sv '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -sv '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -sc tests

TESTNAME="s21_grep -sc test #1"
grep -sc School-21 test2.txt > grep_result.txt
./s21_grep -sc School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sc test #2"
grep -sc SCHOOL test2.txt > grep_result.txt
./s21_grep -sc SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sc test #3"
grep -sc SCHOOL test2.txt > grep_result.txt
./s21_grep -sc SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sc test #4"
grep -sc MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -sc MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sc test #5"
grep -sc '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -sc '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -sl tests

TESTNAME="s21_grep -sl test #1"
grep -sl School-21 test2.txt > grep_result.txt
./s21_grep -sl School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sl test #2"
grep -sl SCHOOL test2.txt > grep_result.txt
./s21_grep -sl SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sl test #3"
grep -sl SCHOOL test2.txt > grep_result.txt
./s21_grep -sl SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sl test #4"
grep -sl MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -sl MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sl test #5"
grep -sl '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -sl '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -sn tests

TESTNAME="s21_grep -sn test #1"
grep -sn School-21 test2.txt > grep_result.txt
./s21_grep -sn School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sn test #2"
grep -sn SCHOOL test2.txt > grep_result.txt
./s21_grep -sn SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sn test #3"
grep -sn SCHOOL test2.txt > grep_result.txt
./s21_grep -sn SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sn test #4"
grep -sn MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -sn MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sn test #5"
grep -sn '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -sn '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -sh tests

TESTNAME="s21_grep -sh test #1"
grep -sh School-21 test2.txt > grep_result.txt
./s21_grep -sh School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sh test #2"
grep -sh SCHOOL test2.txt > grep_result.txt
./s21_grep -sh SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sh test #3"
grep -sh SCHOOL test2.txt > grep_result.txt
./s21_grep -sh SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sh test #4"
grep -sh MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -sh MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sh test #5"
grep -sh '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -sh '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -sf tests

TESTNAME="s21_grep -sf test #1"
grep -sf reg.txt test2.txt > grep_result.txt
./s21_grep -sf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sf test #2"
grep -sf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -sf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -so tests

TESTNAME="s21_grep -so test #1"
grep -so School-21 test2.txt > grep_result.txt
./s21_grep -so School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -so test #2"
grep -so SCHOOL test2.txt > grep_result.txt
./s21_grep -so SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -so test #3"
grep -so SCHOOL test2.txt > grep_result.txt
./s21_grep -so SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -so test #4"
grep -so MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -so MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -fi tests

TESTNAME="s21_grep -fi test #1"
grep -if reg.txt test2.txt > grep_result.txt
./s21_grep -fi reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -f test #2"
grep -if reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -if reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -fv tests

TESTNAME="s21_grep -fv test #1"
grep -vf reg.txt test2.txt > grep_result.txt
./s21_grep -vf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -fv test #2"
grep -vf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -vf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -cf tests

TESTNAME="s21_grep -cf test #1"
grep -cf reg.txt test2.txt > grep_result.txt
./s21_grep -cf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -cf test #2"
grep -cf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -cf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -lf tests

TESTNAME="s21_grep -lf test #1"
grep -lf reg.txt test2.txt > grep_result.txt
./s21_grep -lf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -lf test #2"
grep -lf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -lf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -nf tests

TESTNAME="s21_grep -lf test #1"
grep -nf reg.txt test2.txt > grep_result.txt
./s21_grep -nf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -nf test #2"
grep -nf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -nf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -hf tests

TESTNAME="s21_grep -hf test #1"
grep -hf reg.txt test2.txt > grep_result.txt
./s21_grep -hf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -hf test #2"
grep -hf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -hf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -sf tests

TESTNAME="s21_grep -sf test #1"
grep -sf reg.txt test2.txt > grep_result.txt
./s21_grep -sf reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -sf test #2"
grep -sf reg.txt test1.txt test2.txt > grep_result.txt
./s21_grep -sf reg.txt test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -of tests

TESTNAME="s21_grep -of test #1"
grep -of reg.txt test2.txt > grep_result.txt
./s21_grep -of reg.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -oe tests

TESTNAME="s21_grep -oe test #1"
grep -oe School-21 test2.txt > grep_result.txt
./s21_grep -oe School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oe test #2"
grep -oe SCHOOL test2.txt > grep_result.txt
./s21_grep -oe SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oe test #3"
grep -oe SCHOOL test2.txt > grep_result.txt
./s21_grep -oe SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oe test #4"
grep -oe MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -oe MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -oi tests

TESTNAME="s21_grep -oi test #1"
grep -oi School-21 test2.txt > grep_result.txt
./s21_grep -oi School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oi test #2"
grep -oi SCHOOL test2.txt > grep_result.txt
./s21_grep -oi SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oi test #3"
grep -oi SCHOOL test2.txt > grep_result.txt
./s21_grep -oi SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -oc tests

TESTNAME="s21_grep -oc test #1"
grep -oc School-21 test2.txt > grep_result.txt
./s21_grep -oc School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oc test #2"
grep -oc SCHOOL test2.txt > grep_result.txt
./s21_grep -oc SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oc test #3"
grep -oc SCHOOL test2.txt > grep_result.txt
./s21_grep -oc SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oc test #4"
grep -oc MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -oc MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oc test #5"
grep -oc '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -oc '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -ol tests

TESTNAME="s21_grep -ol test #1"
grep -ol School-21 test2.txt > grep_result.txt
./s21_grep -ol School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ol test #2"
grep -ol SCHOOL test2.txt > grep_result.txt
./s21_grep -ol SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ol test #3"
grep -ol SCHOOL test2.txt > grep_result.txt
./s21_grep -ol SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ol test #4"
grep -ol MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -ol MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -ol test #5"
grep -ol '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -ol '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -on tests

TESTNAME="s21_grep -on test #1"
grep -on School-21 test2.txt > grep_result.txt
./s21_grep -on School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -on test #2"
grep -on SCHOOL test2.txt > grep_result.txt
./s21_grep -on SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -on test #3"
grep -on SCHOOL test2.txt > grep_result.txt
./s21_grep -on SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -on test #4"
grep -on MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -on MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -oh tests

TESTNAME="s21_grep -oh test #1"
grep -oh School-21 test2.txt > grep_result.txt
./s21_grep -oh School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oh test #2"
grep -oh SCHOOL test2.txt > grep_result.txt
./s21_grep -oh SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oh test #3"
grep -oh SCHOOL test2.txt > grep_result.txt
./s21_grep -oh SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oh test #4"
grep -oh MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -oh MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -oh test #5"
grep -oh '[a-z]' test1.txt test2.txt > grep_result.txt
./s21_grep -oh '[a-z]' test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

# s21_grep -os tests

TESTNAME="s21_grep -os test #1"
grep -os School-21 test2.txt > grep_result.txt
./s21_grep -os School-21 test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -os test #2"
grep -os SCHOOL test2.txt > grep_result.txt
./s21_grep -os SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -os test #3"
grep -os SCHOOL test2.txt > grep_result.txt
./s21_grep -os SCHOOL test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

TESTNAME="s21_grep -os test #4"
grep -os MCDONALD test1.txt test2.txt > grep_result.txt
./s21_grep -os MCDONALD test1.txt test2.txt > s21_grep_result.txt
cmp grep_result.txt s21_grep_result.txt || echo ">>> ${TESTNAME} : FAILED"

echo 's21_grep test are finished.'
