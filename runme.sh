#!/bin/bash

#settings
THREADS=8
RESTTHREADS=100

# get docker container IP address
# last line in container /etc/hosts
# IP=`awk 'END{print}' /etc/hosts | awk '{print $1}' `
# echo $IP

#global listen
IP = 0.0.0.0

#start moses2 as a daemon
moses/bin/moses2 -f config/aren-noproc-server-optimized-moses2.ini --threads $THREADS 

#Run REST-Moses adapter
/usr/bin/python bin/python-server.py -nthreads $RESTTHREADS -ip $IP -mosesurl http://127.0.0.1:6003/RPC2 -moseshome moses -slang ar -tlang en -log moses

