#!/bin/bash
for i in $( cat users.txt ); do
    deluser $i
    rm -rf /home/$i
    echo  "deleted" 
done
