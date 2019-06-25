#!/bin/bash

for i in $( cat users.txt ); do
    adduser --force-badname $i --gecos "$i,RoomNumber,WorkPhone,HomePhone" --disabled-password
    echo "$i:123456" | chpasswd
    setfacl -m user:$i:rw /var/run/docker.sock
    chmod 700 /home/$i
    mkdir /home/$i/workdir
    chmod 777 /home/$i/workdir/
    cd /home/$i/workdir/
    echo Wellcome $i, hope enjoy your learning. >>example.txt
done
