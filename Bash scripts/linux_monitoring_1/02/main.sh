#!/bin/bash

if [[ $# -ne 0 ]]
then
	echo "Scipt should run without parameters. Try again."
	exit 1
fi

path=$(realpath "${BASH_SOURCE:-$0}")
DIR_PATH=`dirname $path`

source $DIR_PATH/system_monitoring.sh

system_monitoring

source $DIR_PATH/make_status.sh
