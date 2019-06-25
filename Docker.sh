#!/bin/bash

echo $DISPLAY
xhost +

docker run --privileged=true -it --net=host -e DISPLAY --volume /tmp/.x11-unix -v ~/Moil_docker:/home/student/workdir oil:1.1 /bin/bash
