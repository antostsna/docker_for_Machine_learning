#!/bin/bash

for i in $( cat users.txt ); do
    adduser --force-badname $i --gecos "$i,RoomNumber,WorkPhone,HomePhone" --disabled-password
    echo "$i:123456" | chpasswd
    setfacl -m user:$i:rw /var/run/docker.sock
    cp run.sh /home/$i
    mkdir /home/$i/workdir
    cd /home/$i/workdir/
    echo Wellcome $i, hope you enjoy the lecture. Fell free to ask some question when you get problem. Thank You !!!! >>Readme.txt
    mkdir /home/$i/workdir/Documents
    mkdir /home/$i/workdir/Data
    chmod 700 /home/$i
    chmod -R 777 /home/$i/workdir/
    chmod 764 /home/$i/workdir/Readme.txt
    echo "user $i created !!!"
done
