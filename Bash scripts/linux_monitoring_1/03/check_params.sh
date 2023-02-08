function check_correct_param {
	if [ $1 -ne 4 ]
	then
		echo "Not all parameters specified. Retry script again."
		exit 0
	fi
	for var in $key_bgr $key_clr $val_bgr $val_clr
	do
		if ! [[ $var =~ ^[+]?[1-6] ]]
		then
			echo "Wrong format parameters. [1 - white; 2 - red; 3 - green; 4 - blue; 5 - purple; 6 - black] Retry script again."
			exit 0
		fi
	done
	if [ $key_bgr = $key_clr ] || [ $val_bgr = $val_clr ]
	then
		echo "Background-color and font-color are identical. Retry script again."
		exit 0
	fi
}
