DIFF=$(( ($END - $START)/100000000 ))
DIFF_len=`echo -n $DIFF | wc -c`
for (( i = 1; i <= 10; i++ ))
do
	if [[ $DIFF_len -eq 1 ]]
	then
		DIFF=0.$DIFF
		break
	fi
	if [[ $DIFF_len -eq $i ]]
	then
		DIFF=`echo $DIFF | cut -c 1-$(($i-1))`,`echo $DIFF | cut -c $i-5`
		break
	fi
done
echo "Script execution time (in seconds) = $DIFF"
