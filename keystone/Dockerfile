FROM ubuntu:12.04

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get -y install python-software-properties
RUN add-apt-repository cloud-archive:icehouse
RUN apt-get -y update
RUN apt-get -y install keystone

