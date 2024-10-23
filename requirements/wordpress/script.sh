#!/bin/bash

# Sleep for 10 seconds to allow services to initialize
sleep 5

# Change to the web root directory
cd /var/www/html

# Download WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make the WP-CLI executable
chmod +x wp-cli.phar

# Download WordPress core files
./wp-cli.phar core download --allow-root

# Create the wp-config.php file
./wp-cli.phar config create --allow-root --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb

# Install WordPress
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

# Start PHP-FPM
php-fpm8.2 -F
