#!/bin/bash

msg="Скрипт запускается c 1 параметром, который принимает значение 1, 2, 3 или 4"

if [[ $# -ne 1 ]]
then
	echo $msg
    exit 1
fi

source ./sort.sh
