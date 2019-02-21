FROM ubuntu:16.04


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install sudo
RUN apt-get -y install apt-utils
RUN apt-get update && apt-get install -y --no-install-recommends \
    iproute2 \
    iputils-ping \
    net-tools \
    tcpdump \
    vim \
    x11-xserver-utils \
    xterm \
    nmap \
    python-setuptools \
    libssl-dev \
    libcap-dev 
RUN apt-get update && apt-get install -y --no-install-recommends \
pkg-config gcc make build-essential libexpat-dev libgmp-dev \
             libssl-dev libpcap-dev byacc flex \
             python-dev

RUN  apt-get -y update && \
     apt-get -y install ssh
RUN apt-get -y install libnuma-dev
RUN apt-get -y install linux-headers-4.15.0-29-generic

COPY mininet /root/mininet
COPY ivs /root/ivs
COPY lagopus /root/lagopus

RUN cd /root/mininet && util/install.sh -nfil

RUN  apt-get -y update && \
 apt-get -y install openvswitch-switch


EXPOSE 6633 6653 6640
