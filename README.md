# SCA-Cloud-School-Application
Technical assessment for SCA Cloud application

This repository contains solution for both exercise one and two

The stable and feature branch contains a dockerfile that display a webpage and a  text.

The exercise2 branch is a CLI application which can check for OS type and install nodejs, curl, and wget if not available according to the command suitable for the enviroment.
The solution is developed in shell script.

## EXERCISE 1

Link to dockerhub - https://hub.docker.com/repository/docker/kajol232/sca-cloud-application-exercise1

### Exercise 1 Test process

1. Created a folder on my desktop and named SCACloud.

2. Run Ubuntu WSL and redirect to SCACloud directory path.
3. Creates a directory named nginx_docker using "mkdir nginx_docker" command.
4. Redirect into the nginx_docker folder.
5. Create an html file named index.html and a CSS file named style.css.
6. Creates a file named Dockerfile using "touch Dockerfile" command.
7. Edited the Dockerfile through nano editor.
8. Build my image using "docker buid -t welcome ."

````
    *********BUILD OUTPUT**************
      [+] Building 10.2s (12/12) FINISHED
 => [internal] load .dockerignore                                                                 1.2s
 => => transferring context: 2B                                                                   0.2s
 => [internal] load build definition from Dockerfile                                              1.7s
 => => transferring dockerfile: 38B                                                               0.2s
 => [internal] load metadata for docker.io/library/centos:7                                       6.3s
 => [auth] library/centos:pull token for registry-1.docker.io                                     0.0s
 => [internal] load build context                                                                 0.6s
 => => transferring context: 60B                                                                  0.1s
 => [1/6] FROM docker.io/library/centos:7@sha256:0f4ec88e21daf75124b8a9e5ca03c37a5e937e0e108a255  0.1s
 => CACHED [2/6] RUN yum -y install epel-release                                                  0.0s
 => CACHED [3/6] RUN yum -y update                                                                0.0s
 => CACHED [4/6] RUN yum -y install nginx                                                         0.0s
 => CACHED [5/6] ADD index.html /usr/share/nginx/html/index.html                                  0.0s
 => CACHED [6/6] ADD style.css /usr/share/nginx/html/style.css                                    0.0s
 => exporting to image                                                                            0.6s
 => => exporting layers                                                                           0.0s
 => => writing image sha256:fbb73a9837159f4f093d4363d4048a4161be8a87955b198e0251dee929f5b839      0.1s
 => => naming to docker.io/library/welcome
````

9. Run image using "docker run -dit -p 8081:80 welcome" command
   ````*************RUN OUTPUT**********
   27d7000a26d1048b24714a55fa5a7c9450ee37ab9f36d352d2825b6551aa18c7````
   
10 Run my image on a browser using "http://localhost:8081/" URL.

````
**********DOCKERFILE CONTENT*******************
   #Loading base image
    FROM centos:7
    
   #Installing nginx on my environment
    RUN yum -y install epel-release
    RUN yum -y update
    RUN yum -y install nginx
    
   #Copying files from local to the images file system
    ADD index.html /usr/share/nginx/html/index.html
    ADD style.css /usr/share/nginx/html/style.css
    
   #Telling docker the network port the container will listen on
    EXPOSE 80/tcp

   #Specifying entrypoint to the application to docker
    CMD ["nginx", "-g daemon off;"]
  ````
    
````
****************HTML FILE CONTENT************
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="style.css"/>
    <title>Welcome to SCA Cloud School Application</title>
</head>
<body>
    <p class="paragraph">Welcome to SCA Cloud School Application</p>
    
</body>
</html>
````

````
**************************CSS FILE CONTENT********************
body {
  background-color: antiquewhite
}
.paragraph {
	background-color: azure;
	padding: 20px;
}
````

## EXERCISE 2

* The exercise2 branch contains solution for the CLI application for installing Nodejs, Curl and wget.
* The CLI Application was developed with SHELL SCRIPT.

***************************SCRIPT CONTENT*************************************
 #Shebang statements
#!/bin/sh

#Checking the OS of the User and splitting into substring using delimeter to get the actual OSTYPE.
VER=$(grep '^NAME' /etc/os-release)
SUB=$(echo $VER | cut -d '=' -f 2)
TYPE=$(echo $SUB | cut -d '"' -f 2)
echo "$TYPE"

#Using the OS Type of the user to control commands to execute using decision making statements.
if [[ "$TYPE"=="Ubuntu" || "$TYPE"=="Debian" ]];
then
	sudo apt update -y
	if ! command -v wget &> /dev/null
	then
		sudo apt install -y wget
	fi
	if ! command -v curl &> /dev/null
	then
		sudo apt install -y curl
	fi
	if ! command -v node &> /dev/null
	then
		sudo apt install -y nodejs
	fi
elif [[ "$TYPE"=="Rhel" || "$TYPE"=="CentOs" ]];
then
	sudo yum -y update
	if ! command -v wget &> /dev/null
	then
		sudo yum install wget
	fi
	if ! command -v curl &> /dev/null
	then
		sudo yum -y install curl
	fi
	if ! command -v node &> /dev/null
	then
		sudo yum -y install nodejs
	fi
elif [[ "$TYPE"=="Fedora" ]];
then
	sudo dnf -y update
	if ! command -v wget &> /dev/null
	then
		sudo yum install wget
	fi
	if ! command -v curl &> /dev/null
	then
		sudo dnf install curl
	fi
	if ! command -v node &> /dev/null
	then
		sudo dnf install nodejs
	fi
elif [[ "$TYPE"=="SUSE" || "$TYPE"=="OpenSUSE" ]];
then
	sudo zypper update
	if ! command -v wget &> /dev/null
	then
		sudo zypper install wget
	fi
	if ! command -v curl &> /dev/null
	then
		sudo zypper install curl
	fi
	if ! command -v node &> /dev/null
	then
		zypper addrepo http://download.opensuse.org/repositories/devel:/languages:/nodejs/openSUSE_Leap_15.0 node 10
		Zypper refresh
		zypper install nodejs10
	fi
elif [[ "$TYPE"=="Arch" || "$TYPE"=="Manjaro" ]];
then
	sudo pacman -syu
	if ! command -v wget &> /dev/null
	then
		sudo pacman -sy wget
	fi
	if ! command -v curl &> /dev/null
	then
		sudo pacman -sy curl
	fi
	if ! command -v node &> /dev/null
	then
		sudo pacman -sy nodejs
	fi
fi
