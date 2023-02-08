#!/bin/bash

#200 - ok success 
#201 - ok create (made new resourse)
#400 - bad request (wrong syntaxis)
#401 - Unauthorized (not enouf athorized data)
#403 - Forbidden (get post but do t want to autorized)
#404 - Not Found
#500 - Internal Server Error (server got unexpected error, that deny make request)
#501 - Not Implemented (server do not support the functionality required to fulfil the request)
#502 - Bad Gateway (wrong responce from upstream server)
#503 - Service Unavailable (server operates proparly, but cant handle a request at the moment)

source ./make_log_str.sh
source ./random.sh

if ! [[ -f access.log ]]
then
	touch access.log
fi

rnd=`random 100 900`
for (( i=0; i<=$rnd; i++ ))
do
	sleep .1
	make_log_str >> access.log
	make_log_str >> access_2.log
	make_log_str >> access_3.log
	make_log_str >> access_4.log
	make_log_str >> access_5.log
done
