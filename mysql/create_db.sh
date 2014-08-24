#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

echo "=> Creating database for keystone"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 5
  mysql -uroot -e "CREATE DATABASE keystone"
  RET=$?
done

echo "=> Creating database for glance"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 5
  mysql -uroot -e "CREATE DATABASE glance"
  RET=$?
done

echo "=> Creating database for nova"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 5
  mysql -uroot -e "CREATE DATABASE nova"
  RET=$?
done

echo "=> Creating database for neutron"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 5
  mysql -uroot -e "CREATE DATABASE neutron"
  RET=$?
done

echo "=> Creating database for horizon"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 5
  mysql -uroot -e "CREATE DATABASE horizon"
  RET=$?
done

echo "=> Creating database for ceilometer"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 5
  mysql -uroot -e "CREATE DATABASE ceilometer"
  RET=$?
done

echo "=> Creating database for cinder"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 5
  mysql -uroot -e "CREATE DATABASE cinder"
  RET=$?
done


mysqladmin -uroot shutdown

echo "=> Done!"
