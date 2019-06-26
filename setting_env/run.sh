#!/bin/bash

echo $DISPLAY
xhost +
clear

docker run --privileged=true -it --net=host -e DISPLAY --volume /tmp/.x11-unix -v ~/workdir:/home/student/workdir oil:1.1 /bin/bash
