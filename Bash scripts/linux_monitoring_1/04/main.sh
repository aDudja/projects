#!/bin/bash

path=$(realpath "${BASH_SOURCE:-$0}")
DIR_PATH=`dirname $path`

if [[ $# -ne 0 ]]
then
	echo "Scipt should run without parameters. Try again."
	exit 1
fi

source $DIR_PATH/check_params.sh
source $DIR_PATH/system_monitoring.sh
source $DIR_PATH/get_color_config.sh
source $DIR_PATH/color_info.sh

default_config=(4 3 2 1)
colors=( default white red green blue purple black )

if [ -e $DIR_PATH/color.conf ]
then
	config[0]=`cat $DIR_PATH/color.conf | grep 'column1_background=' | awk -F'=' '{print $2}' | cut -c 1`
	config[1]=`cat $DIR_PATH/color.conf | grep 'column1_font_color=' | awk -F'=' '{print $2}' | cut -c 1`
	config[2]=`cat $DIR_PATH/color.conf | grep 'column2_background=' | awk -F'=' '{print $2}' | cut -c 1`
	config[3]=`cat $DIR_PATH/color.conf | grep 'column2_font_color=' | awk -F'=' '{print $2}' | cut -c 1`
fi

check_correct_param
system_monitoring
color_info
