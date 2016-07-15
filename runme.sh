#!/bin/bash


# get docker container IP address

IP=`awk 'NR==1 {print $1}' /etc/hosts`
echo $IP

/usr/bin/python bin/python-server.py -ip IP -mosesurl http://127.0.0.1:6003/RPC2 -moseshome moses -slang ar -tlang en -log moses.log

