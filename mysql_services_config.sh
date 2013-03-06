#!/bin/bash
if [ ! -n "$MYSQLROOTPASS" ]
then
	echo Password for root user in Mysql not defined. Please define it in MYSQLROOTPASS
	exit;
fi
mysql -u root -p$MYSQLROOTPASS <<EOF
create database nova;
create database glance;
create database cinder;
create database keystone;
create database quantum;
grant all privileges on nova.* to nova@"192.168.0.56" identified by "nova";
grant all privileges on glance.* to glance@"192.168.0.51" identified by "glance";
grant all privileges on cinder.* to cinder@"192.168.0.52" identified by "cinder";
grant all privileges on keystone.* to keystone@"192.168.0.50" identified by "keystone";
grant all privileges on keystone.* to keystone@"localhost" identified by "keystone";
grant all privileges on keystone.* to keystone@"%" identified by "keystone";
grant all privileges on quantum.* to quantum@"192.168.0.0.55" identified by "quantum";
EOF
