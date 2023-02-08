function get_color_config {
	col_num=${user_config[$1]}
	col_nam=${colors[${user_config[$1]}]}
	if [[ ${default[$1]} -eq 1 ]]
	then
		col_num=${colors[0]}
	fi 
	echo "$col_num ($col_nam)"
}
