#!/bin/bash

echo $DISPLAY
xhost +

touch exemple.txt
docker run --privileged=true -it --net=host -e DISPLAY --volume /tmp/.x11-unix -v ~/Documents:/home/student/workdir oil:1.1 /bin/bash
