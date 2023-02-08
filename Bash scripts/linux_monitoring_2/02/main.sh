#!/bin/bash

START=$(date +'%d.%m.%y %H:%M:%S')

path=$(realpath "${BASH_SOURCE:-$0}")
DIR_PATH=`dirname $path`
date=`date +%d%m%y`

source make_dir_name.sh
source make_file_name.sh
source check_mem.sh
source random.sh
source random_sys_dir.sh
source get_date.sh

if [[ $# -ne 3 ]]
then
	echo "Script needs three parameters. Try again."
	exit 1
fi

re1='^[a-z][a-z]{1,6}?$'
if ! [[ $1 =~ $re1 ]]
then
	echo "First parameter must have 1-7 letters"
	exit 1
fi

re2='^[a-z][a-z]{1,6}?\.[a-z][a-z]{1,2}?$'
if ! [[ $2 =~ $re2 ]]
then
	echo "Second parameter should look like: (Example: abcdefg.abc)"
	exit 1
fi

re3='^[0-9][0-9]{1,2}?Mb$'
if ! [[ $3 =~ $re3 ]]
then
	echo "Third parameter must be a string: 0-100Mb"
	exit 1
fi

dir_ch=$1
file_ch=`echo $2 | sed 's/\..*//'`
file_ext=`echo $2 | grep -o '\.[a-z]\+$'`
file_size=`echo $3 | sed 's/Mb$//'`

if [[ $file_size -lt 1 ]] || [[ $file_size -gt 100 ]]
then
	echo "Third parameter must be a string: 0-100Mb"
	exit 1	
fi

touch log.txt

while [ 1 ]
do
	src=`get_sys_dir`
	ndirs=`random "1" "100"`
	nfiles=`random "1" "100"`
	for (( i = 1; i <= $ndirs; i++ ))
	do		
		dir_name=`make_dir_name`
		while [[ -d "${src}/$dir_name" ]]
		do
			dir_name=`make_dir_name`
		done		
		mkdir ${src}/${dir_name}
		echo new dir: ${src}/${dir_name} `get_date` >> log.txt
		for (( y = 1; y <= $nfiles; y++))
		do
			file_name=`make_file_name`
			while [[ -f "${src}/${dir_name}/${file_name}" ]]
			do
				file_name=`make_file_name`
			done		
			fallocate -l ${file_size}M ${src}/${dir_name}/${file_name}
			echo new file: ${src}/${dir_name}/${file_name} `get_date` ${file_size}Mb >> log.txt
			check_mem
		done	
	done
done


