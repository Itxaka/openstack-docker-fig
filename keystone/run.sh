#!/bin/bash

# wait for the db to start
sleep 30

# create the database stuff
echo "=> Filling the database"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 2
  /usr/bin/keystone-manage db_sync
  RET=$?
done

# launch keystone to the background
/usr/bin/keystone-all &

# create admin use/role/tenant
export OS_SERVICE_TOKEN=ADMIN_TOKEN
export OS_SERVICE_ENDPOINT=http://localhost:35357/v2.0

echo "=> Creating admin user"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 2
  keystone user-create --name=admin --pass=secrete --email=admin@locahost
  RET=$?
done

echo "=> Creating admin role"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 2
  keystone role-create --name=admin
  RET=$?
done

echo "=> Creating admin tenant"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 2
  keystone tenant-create --name=admin --description="Admin Tenant"
  RET=$?
done

echo "=> Creating admin user role"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 2
  keystone user-role-add --user=admin --tenant=admin --role=admin
  RET=$?
done

echo "=> Creating _member_ user role"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 2
  keystone user-role-add --user=admin --role=_member_ --tenant=admin
  RET=$?
done


echo "=> Creating service tenant"
RET=1
while [[ RET -ne 0 ]]; do
  sleep 2
  keystone tenant-create --name=service --description="Service Tenant"
  RET=$?
done
