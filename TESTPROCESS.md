# SCA-Cloud-School-Application
Technical assessment for SCA Cloud application

#Exercise 1 Test process

1* Created a folder on my desktop and named SCACloud.
2* Run Ubuntu WSL and redirect to SCACloud directory path.
3* Creates a directory named nginx_docker using "mkdir nginx_docker" command.
4* Redirect into the nginx_docker folder.
5* Create an html file named index.html and a CSS file named style.css.
6* Creates a file named Dockerfile using "touch Dockerfile" command.
7* Edited the Dockerfile through nano editor.
8* Build my image using "docker buid -t welcome ."
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
 
 9* Run image using "docker run -dit -p 8081:80 welcome" command
   *************RUN OUTPUT**********
   27d7000a26d1048b24714a55fa5a7c9450ee37ab9f36d352d2825b6551aa18c7
   
10* Run my image on a browser using "http://localhost:8081/" URL.

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

**************************CSS FILE CONTENT********************
body {
  background-color: antiquewhite
}
.paragraph {
	background-color: azure;
	padding: 20px;
}
