#!/bin/bash

path=$(realpath "${BASH_SOURCE:-$0}")
DIR_PATH=`dirname $path`

source $DIR_PATH/check_params.sh
source $DIR_PATH/system_monitoring.sh

key_bgr=$1
key_clr=$2
val_bgr=$3
val_clr=$4

check_correct_param $#
system_monitoring
