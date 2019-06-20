#Dockerfile for MOIL-Ubuntu

FROM ubuntu:18.04
MAINTAINER anto "m07158031@o365.mcut.edu.tw"

USER root
WORKDIR /root

RUN yes | unminimize \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
		apt-utils \
 		nano \
		git \
		make \
		sudo \
		tree \
		vim \
		unzip \
		curl \ 
		wget \
		software-properties-common \
		pkg-config \
  		python3-pip \
		python3-dev \
		man-db \
  && rm -r /var/lib/apt/lists/* \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip 

COPY requirements.txt /root
RUN pip install -r requirements.txt

# Create user "Student" with sudo powers
RUN useradd -m student && \
    usermod -aG sudo student && \
    echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    cp /root/.bashrc /home/student/ 

# Use C.UTF-8 locale to avoid issues with ASCII encoding
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /home
ENV USER student
USER student

CMD [ "/bin/bash" ]
