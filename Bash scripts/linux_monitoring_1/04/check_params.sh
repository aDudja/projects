function check_correct_param {


	for (( i = 0; i < 4; i++ ))
	do
	if [[ ${config[$i]} =~ ^[1-6] ]]
	then
		user_config[$i]=${config[$i]}
	else
		user_config[$i]=${default_config[$i]}
		default[$i]=1
	fi		
	done
	if [ ${user_config[0]} = ${user_config[1]} ] || [ ${user_config[2]} = ${user_config[3]} ]
	then
		echo "Background-color and font-color are identical. Edit color.conf"
		exit 0
	fi
}
