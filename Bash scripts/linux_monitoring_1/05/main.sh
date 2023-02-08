#!/bin/bash
 
START=$(date +%s%N)

src=$(realpath "${BASH_SOURCE:-$0}")
DIR_PATH=`dirname $src`

path=$1

if [[ $# -ne 1 ]]
then
	echo "Script needs one parameter(folder path)"
	exit 1
fi

if [ -z $1 ]
then
	echo "Directory path not specified"
	exit 1
fi

if ! [ -d $1 ];
then
	echo "No such directory: $1"
	exit 1
fi

source $DIR_PATH/system_research.sh

END=$(date +%s%N)
source $DIR_PATH/script_ex_time.sh
