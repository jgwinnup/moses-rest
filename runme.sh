#!/bin/bash

#settings
THREADS=8


# get docker container IP address

IP=`awk 'NR==1 {print $1}' /etc/hosts`
echo $IP

#start moses2 as a daemon
bin/moses2 -f config/aren-noproc-server-optimized-moses2.ini --threads $THREADS 

#Run REST-Moses adapter
/usr/bin/python bin/python-server.py -ip $IP -mosesurl http://127.0.0.1:6003/RPC2 -moseshome moses -slang ar -tlang en -log moses.log

