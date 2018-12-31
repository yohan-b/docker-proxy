FROM debian:wheezy
MAINTAINER yohan <783b8c87@scimetis.net>
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list
RUN apt-get update && apt-get -y install squid procps iptables
COPY squid.conf /etc/squid/
RUN chown root:proxy /etc/squid/*
EXPOSE 3128
ENTRYPOINT ["squid", "-f", "/etc/squid/squid.conf", "-N", "-d", "1"]
