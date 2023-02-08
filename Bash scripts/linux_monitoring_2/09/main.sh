#!/bin/bash

if [[ $# -ne 0 ]]
then
	echo "Script does not need parameters. Try again."
	exit 1
fi

source ./create_metrics.sh