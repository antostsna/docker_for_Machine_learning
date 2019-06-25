#!/bin/bash

for i in $( cat users.txt ); do
    adduser --force-badname $i --gecos "$i,RoomNumber,WorkPhone,HomePhone" --disabled-password
    echo "$i:123456" | chpasswd
    setfacl -m user:$i:rw /var/run/docker.sock
done
