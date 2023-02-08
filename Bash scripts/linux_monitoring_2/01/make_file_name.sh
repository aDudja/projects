function make_file_name {
	n_file_ch=${#file_ch}
	average=$((248/$n_file_ch))
	for (( i = 0; i < $n_file_ch; i++ ))
	do
		rand_y=`random "1" "$average"`
		for (( y = 0; y < $rand_y; y++ ))
		do	
			f_result="${f_result}${file_ch:$i:1}"
		done
	done
	if [[ ${#f_result} -lt 4 ]]
	then
		make_file_name
	fi
	echo ${f_result}_${date}${file_ext}
}
