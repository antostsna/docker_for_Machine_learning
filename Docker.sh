#!/bin/bash

docker run -it --net=host -e DISPLAY --volume /tmp/.x11-unix -v /home/$USER:/home/student oil:1.6 /bin/bash
