# Docker Image For Machine Learning
---
note: just for operating system linux


This image include:
- can running user interface apps
- have install library for machine learning or deep learning program.

## How to use
first you must build the image. get in to docker_image folder and typing comand in terminal:
- docker build -t oil-ml:1.0

for running container, you can following this command:
docker run --privileged=true -it --net=host -e DISPLAY --volume /tmp/.x11-unix -v /home/$USER:/home/sudoer oil-ml:2.0 /bin/bash


## Reference 

[1. Docker volume](https://docs.docker.com/storage/volumes/)

[3. Use Docker without sudo](https://linoxide.com/linux-how-to/use-docker-without-sudo-ubuntu/)

[4. Setting Docker after instalation](https://docs.docker.com/install/linux/linux-postinstall/)









