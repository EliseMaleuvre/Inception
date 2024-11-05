#!/bin/bash

# Sleep for 10 seconds to allow services to initialize
sleep 30

# Change to the web root directory
cd /var/www/html

# Download WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make the WP-CLI executable
chmod +x wp-cli.phar

# Download WordPress core files
./wp-cli.phar core download --allow-root

# Create the wp-config.php file
./wp-cli.phar config create --allow-root --dbname=$MDB_NAME --dbuser=$MDB_RANDOM_USER --dbpass=$MDB_RANDOM_PASS --dbhost=mariadb:3306 --path='/var/www/html'

# Install WordPress
./wp-cli.phar core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADM_USER --admin_password=$WP_ADM_PASS --admin_email=$WP_ADM_EMAIL --path='/var/www/html'

./wp-cli.phar user create $WP_RANDOM_USER $WP_RANDOM_EMAIL --user_pass=$WP_RANDOM_PASS --role=author --allow-root --path='/var/www/html'

# Start PHP-FPM
php-fpm7.4 -F
