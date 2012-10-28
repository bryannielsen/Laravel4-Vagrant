#!/bin/bash

mysql -uroot -proot < "/vagrant/puppet/scripts/enable_remote_mysql_access.sql"
sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
/etc/init.d/mysql restart
