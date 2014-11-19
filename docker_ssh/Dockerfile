FROM debian:7.5
MAINTAINER mlecarme@bearstech.com
 
ENV DEBIAN_FRONTEND noninteractive
 
# Basic needed tools
RUN apt-get -q update

RUN apt-get install -q -y openssh-server python
RUN mkdir -p /root/.ssh
COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
RUN mkdir /var/run/sshd

EXPOSE 22
CMD /usr/sbin/sshd -D
