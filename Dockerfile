FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install build-essential libxml2 libssh2-1-dev clang cmake -y
RUN apt-get build-dep curl -y
