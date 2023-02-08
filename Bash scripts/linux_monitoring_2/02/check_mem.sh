function check_mem {
	space=`df / | awk 'NR==2{print $4}'`
	if [[ $space -lt 1000000 ]]
	then
		echo "Out of memory"
		END=$(date +'%d.%m.%y %H:%M:%S')
		echo "START SCRIPT: $START | END SCRIPT: $END | RUNTIME SCRIPT: $SECONDS sec" | tee -a log.txt
		exit 1	
	fi
}
