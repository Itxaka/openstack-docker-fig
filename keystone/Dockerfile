FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get -y install keystone python-mysqldb
ADD keystone.conf /etc/keystone/keystone.conf
ADD run.sh /run.sh
RUN chmod 755 /run.sh
EXPOSE 5000 35357
CMD ["/run.sh"]
