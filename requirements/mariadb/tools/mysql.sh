#!/bin/bash

# Install MySQL
service mysql start;

# Set root password
mysqladmin -u root password 'root';

# Execute mysql_secure_installation
exec mysqld_safe & sleep 5;