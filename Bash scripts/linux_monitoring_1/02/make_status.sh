echo "Write data to a file? Y/N"
read tofile
if [ $tofile = Y ] || [ $tofile = y ]
then
	save_t=`date +"%d_%m_%y_%H_%M_%S"`
	system_monitoring > $DIR_PATH/${save_t}.status
fi
