FROM debian:7
MAINTAINER mlecarme@bearstech.com
 
ENV DEBIAN_FRONTEND noninteractive
 
# Basic needed tools
RUN apt-get -q update
RUN apt-get -q install -y python-crypto python-httplib2 python-jinja2 python-paramiko python-pkg-resources python-yaml
ADD http://ftp.de.debian.org/debian/pool/main/a/ansible/ansible_1.7.2+dfsg-2_all.deb /tmp/

RUN dpkg -i /tmp/ansible_1.7.2+dfsg-2_all.deb
