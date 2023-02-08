#!/bin/bash

path=$(realpath "${BASH_SOURCE:-$0}")
DIR_PATH=`dirname $path`
date=`date +%d%m%y`

source make_dir_name.sh
source make_file_name.sh
source check_mem.sh
source random.sh
source get_date.sh

if [[ $# -ne 6 ]]
then
	echo "Script needs six parameters. Try again."
	exit 1
fi

if ! [ -d $1 ];
then
	echo "No such directory: $1"
	exit 1
fi

re2='^[0-9]+'
if ! [[ $2 =~ $re2 ]]
then
	echo "Second parameter must be a number"
	exit 1
fi

re3='^[a-z][a-z]{1,6}?$'
if ! [[ $3 =~ $re3 ]]
then
	echo "Third parameter must have 1-7 letters"
	exit 1
fi

re4='^[0-9]+'
if ! [[ $4 =~ $re2 ]]
then
	echo "Fourth parameter must be a number"
	exit 1
fi

re5='^[a-z][a-z]{1,6}?\.[a-z][a-z]{1,2}?$'
if ! [[ $5 =~ $re5 ]]
then
	echo "Fifth parameter should look like: (Example: abcdefg.abc)"
	exit 1
fi

re6='^[0-9][0-9]{1,2}?kb$'
if ! [[ $6 =~ $re6 ]]
then
	echo "Sixth parameter must be a string: 0-100kb"
	exit 1
fi

src=$1
ndirs=$2
dir_ch=$3
nfiles=$4
file_ch=`echo $5 | sed 's/\..*//'`
file_ext=`echo $5 | grep -o '\.[a-z]\+$'`
file_size=`echo $6 | sed 's/kb$//'`

if [[ $file_size -lt 1 ]] || [[ $file_size -gt 100 ]]
then
	echo "Sixth parameter mush be a string: 0-100kb"
	exit 1	
fi

touch log.txt

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
	fallocate -l ${file_size}K ${src}/${dir_name}/${file_name}
	echo new file: ${src}/${dir_name}/${file_name} `get_date` ${file_size}kb >> log.txt
	check_mem
	done	
done






















