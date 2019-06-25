#!/bin/bash
for i in $( cat user.txt ); do
   setfacl -m user:$i:rw /var/run/docker.sock
done
