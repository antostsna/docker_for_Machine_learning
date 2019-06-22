#!/bin/bash

export DISPLAY=':0'
xhost +

docker run -it --net=host -e DISPLAY --volume /tmp/.x11-unix -v /home/$USER:/home/student/workdir oil:3.5 /bin/bash
