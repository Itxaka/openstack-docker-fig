FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get -y install keystone
ADD keystone.conf /etc/keyston.conf
RUN keystone-manage db_sync
EXPOSE 5000
CMD ["keystone-all"]

