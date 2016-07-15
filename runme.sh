#!/bin/bash

#settings
THREADS=8

# get docker container IP address
# last line in container /etc/hosts
IP=`awk 'END{print}' /etc/hosts | awk '{print $1}' `
echo $IP

#start moses2 as a daemon
moses/bin/moses2 -f config/aren-noproc-server-optimized-moses2.ini --threads $THREADS 

#Run REST-Moses adapter
/usr/bin/python bin/python-server.py -ip $IP -mosesurl http://127.0.0.1:6003/RPC2 -moseshome moses -slang ar -tlang en -log moses

