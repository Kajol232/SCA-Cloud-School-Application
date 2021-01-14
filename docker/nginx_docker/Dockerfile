FROM centos:7
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx

ADD index.html /usr/share/nginx/html/index.html
ADD style.css /usr/share/nginx/html/style.css

EXPOSE 80/tcp

CMD ["nginx", "-g daemon off;"]
