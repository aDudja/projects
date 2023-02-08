if [[ $# -ne 1 ]]
then
	echo "Script needs one parameters. Try again."
	exit 1
fi

re='^[1-3]+'
if ! [[ $1 =~ $re ]]
then
	echo "Second parameter must be a number: 1-3"
	exit 1
fi

if [[ $1 -eq 1 ]]
then
	echo "Path to log file:"
	read path_log_file
	if ! [[ -f $path_log_file ]]
	then
		echo "No such log file."
		exit 1
	fi	
	nstring=`cat $path_log_file | wc -l`
	for (( i = 1; i <= $nstring; i++))
	do
		file_or_dir_name=`cat $path_log_file | sed -n ${i}p | awk '{print $3}'`
		if [[ -d $file_or_dir_name ]]
		then
			rm -rf $file_or_dir_name
		fi
	done	
fi

if [[ $1 -eq 2 ]]
then
	read -p "Enter date start (YYYY-MM-DD HH:MM): " start_date
	read -p "Enter date end (YYYY-MM-DD HH:MM): " end_date
	find / -type f -newerct "$start_date" ! -newerct "$end_date"  -exec rm -rf {} \;	
	find / -type d -newerct "$start_date" ! -newerct "$end_date" -empty -prune -exec rm -rf {} \;
fi

if [[ $1 -eq 3 ]]
then
	read -p "Enter file mask: " mask
	find / -type f -name "${mask}.*" -exec rm -rf {} \;
	find / -type d -name "${mask}" -prune -exec rm -rf {} \;
fi
