### Docker Image For Machine Learning

*email: m07158031@o365.mcut.edu.tw*

---

This docker image running Ubuntu operating system (OS) include package library and framework for doing machine learning program with setting user Interface application. this image can work properly in **windows** or in **Linux**.  

#### Specs:

- ipykernel==5.1.1
- ipython==7.7.0
- jupyter==1.0.0
- jupyter-c-kernel==1.2.2
- Keras==2.2.4
- matplotlib==3.1.1
- notebook==5.6.0
- numpy==1.17.0
- opencv-python==4.1.0.25
- pandas==0.25.0
- Pillow==6.1.0
- scikit-learn==0.21.2
- scipy==1.3.0
- seaborn==0.9.0
- tensorflow==1.14.0
- tornado==4.5.3

---

### setup 

Install docker following the guideline installation for your Operating System (OS) Platform from [docker documentation](https://docs.docker.com/install/)

---

#### Obtaining docker image

- Download from docker hub
  - you can visit this link to download [image from docker hub](https://hub.docker.com/r/anto112/oil-ml)
- clone this repository and build the docker image
  - *docker build -t oil-ml:1.0*

---

### Setting On Windows

1. Download and install [xming](https://sourceforge.net/projects/xming/) for Xserver in Windows.

4. After that add Ip addres in Host Xming like [this article](https://blogs.msdn.microsoft.com/jamiedalton/2018/05/17/windows-10-docker-gui/). you can see the step by step in bellow this .

   a. Go to the c:\Program Files (x86)\Xming\x0.hosts

   <img src ="/Picture/hostt.jpg" />

   b. Open the X0.host file and add the IP address your pc. i suggest using Visual studio code.

   ​					<img src="/Picture/vscode.jpg" />

    

5. Then open PowerShell as administrator, set a DISPLAY environmental variable to your ip address.<img src="/Picture/pwrsh.jpg" />

6. Run docker Container from PowerShell with typing command: 

   - ***docker run -it --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix oil-ml:1.0 /bin/bash***

   for make sure the Xserver is work, you can typing **Xclock**

   <img src="/Picture/xclock.jpg" />

   

   After that you can run all of the user interface application such as **jupyter notebook**
   
   <img src ="/Picture/jup.jpg" />

### Linux

1. Setting your user can [run docker without sudo](https://linoxide.com/linux-how-to/use-docker-without-sudo-ubuntu/)  

   - *sudo setfacl -m user:$USER:rw /var/run/docker.sock*

2. Mount the file .x11-unix  and export DISPLAY to docker command like bellow this. If you can run **xclock** that work properly

   - docker run --privileged=true -it --net=host -e DISPLAY --volume /tmp/.x11-unix -v /home/$USER:/home/sudoer oil-ml:1.0 /bin/bash

   <img src="/Picture/lnx.jpg" />

   - you can run **jupyter notebook**

     <img src= "/Picture/jupl.jpg" />



### Reference

[1. Docker documentation](https://docs.docker.com/install/)

[2. Windows 10, Docker and GUI Apps setting](https://blogs.msdn.microsoft.com/jamiedalton/2018/05/17/windows-10-docker-gui/)

[3. Run docker without sudo  in Linux](https://linoxide.com/linux-how-to/use-docker-without-sudo-ubuntu/)  

[4. docker Volumes](https://docs.docker.com/storage/volumes/)

[5. Setting docker after installation](https://docs.docker.com/install/linux/linux-postinstall/)

