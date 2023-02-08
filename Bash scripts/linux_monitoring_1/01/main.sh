#!/bin/bash

path=$(realpath "${BASH_SOURCE:-$0}")
DIR_PATH=`dirname $path`

if [[ $# -ne 1 ]]
then
	echo "Script needs one text parameter. Try again."
	exit 1
fi

source $DIR_PATH/print.sh
