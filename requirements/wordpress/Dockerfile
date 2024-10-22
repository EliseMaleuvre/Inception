FROM debian:latest

RUN apt-get update && apt upgrade && apt install wget -y \
    && apt install vim -y \
    && apt install php-8.2 php-fpm php-mysql mariadb-client -y \
    && wget https://wordpress.org/latest.tar.gz \
    && cd /var/www \
    && tar -xvzf /latest.tar.gz \
    && chown -R root:root /var/www/wordpress 

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf