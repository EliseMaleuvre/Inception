#!/bin/bash

service mysql start;
sleep 5;
mysqladmin -u root -p $MDB_ROOT_PASSWORD;

mysql -e "CREATE DATABASE IF NOT EXISTS $MDB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'wpuser'@'%' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p $MDB_ROOT_PASSWORD shutdown;

exec mysqld_safe;