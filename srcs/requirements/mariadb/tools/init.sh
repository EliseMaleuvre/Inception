#!/bin/bash

service mariadb start
sleep 5
mysqladmin -u root -p$MDB_ROOT_PASSWORD status 

echo "CREATING DATABASE $MDB_NAME..."
mysql -u root -p$MDB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MDB_NAME;"
mysql -u root -p$MDB_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MDB_RANDOM_USER'@'%' IDENTIFIED BY '$MDB_RANDOM_PASS';"
mysql -u root -p$MDB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO '$MDB_RANDOM_USER'@'%' WITH GRANT OPTION;"
mysql -u root -p$MDB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
echo "DATABASE $MDB_NAME CREATED!"

mysqladmin -u root -p$MDB_ROOT_PASSWORD shutdown 

sleep 10

exec mysqld_safe