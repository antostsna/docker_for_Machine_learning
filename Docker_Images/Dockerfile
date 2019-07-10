#Dockerfile for MOIL-Ubuntu

FROM ubuntu:18.04
MAINTAINER anto "m07158031@o365.mcut.edu.tw"
ENV DEBIAN_FRONTEND noninteractive

USER root
WORKDIR /root

# Use C.UTF-8 locale to avoid issues with ASCII encoding
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV locale-gen en_US.UTF-8
ENV dpkg-reconfigure locales

RUN yes | unminimize \
	&& apt-get update \
	&& apt-get install -qqy x11-apps \
	&& apt-get install -y --no-install-recommends \
		openssh-server \
		build-essential \
		gcc \
		libsqlite3-dev \
		sqlite3 \
		apt-utils \
 		nano \
		gedit \
		git \
		make \
		sudo \
		tree \
		vim \
		unzip \
		curl \ 
		wget \
		gdb \
		software-properties-common \
		pkg-config \
  		python3-pip \
		python3-dev \
		dbus-x11 \
		x11-xserver-utils \
		net-tools \
		man-db \
		firefox \
		xorg \
		xterm \
		openbox \
		libcanberra-gtk-module \
		libcanberra-gtk3-module \
		python3-tk \
	&& apt-get autoremove -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& cd /usr/local/bin \
	&& ln -s /usr/bin/python3 python \
	&& pip3 install --upgrade pip \
	&& pip install --upgrade setuptools
  
COPY requirements.txt /root
RUN pip install -r requirements.txt

RUN python -m bash_kernel.install
RUN install_c_kernel

# Create user "Student" with sudo powers
RUN useradd -m student \
	&& usermod -aG sudo student \
	&& echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
	&& cp /root/.bashrc /home/student \
	&& chown -R --from=root student /home 

WORKDIR /home/student
ENV HOME /home/student
ENV USER student
USER student
ENV PATH /home/student/.local/bin:$PATH

# Avoid first use of sudo warning.
RUN touch ~/.sudo_as_admin_successful
COPY install.sh /tmp
RUN sudo chmod +x /tmp/install.sh
RUN sudo sh -c "/tmp/install.sh"

#change baground shell
RUN echo 'export PS1="\[\e[32m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\]:\w\$ "' >> ~/.bashrc
RUN echo 'echo -ne "\033]10;#430064\007"' >> ~/.bashrc
RUN echo 'echo -ne "\033]11;#FFFFFF\007"' >> ~/.bashrc
RUN echo 'alias exit='echo -ne "\033]110;\007\033]111;\007";""exit'' >> ~/.bashrc

CMD [ "/bin/bash" ]
