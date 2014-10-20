FROM debian:7.5
MAINTAINER mlecarme@bearstech.com
 
ENV DEBIAN_FRONTEND noninteractive
 
# Basic needed tools
RUN apt-get -q update

RUN apt-get install -q -y dropbear
RUN mkdir -p /root/.ssh
COPY authorized_keys /root/.ssh/authorized_keys

EXPOSE 22:2222
CMD /usr/sbin/dropbear -E -F
