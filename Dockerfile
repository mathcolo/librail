FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install build-essential libxml2 libssh2-1-dev clang cmake -y
RUN apt-get build-dep curl -y

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
