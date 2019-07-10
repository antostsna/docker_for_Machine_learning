#!/bin/bash

cp run.sh ~/

for i in $( cat users.txt ); do
    adduser --force-badname $i --gecos "$i,RoomNumber,WorkPhone,HomePhone" --disabled-password
    echo "$i:123456" | chpasswd
    echo /home/$i | xargs -n 1 cp -n ~/run.sh
    mv /home/$i/run.sh /home/$i/.run.sh
    setfacl -m user:$i:rw /var/run/docker.sock
    mkdir /home/$i/workdir
    cd /home/$i/workdir/
    echo Wellcome $i to MOIL_Ubuntu system. Good Luck !!!! >>Readme.txt
    mkdir /home/$i/workdir/Documents
    mkdir /home/$i/workdir/Downloads
    mkdir /home/$i/workdir/Data
    chmod 700 /home/$i
    chmod -R 777 /home/$i/workdir/
    chmod =r /home/$i/workdir/Readme.txt
    echo "user $i created !!!"

done
