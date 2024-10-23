FROM debian:latest

RUN apt-get update 
RUN apt upgrade
RUN apt install vim -y 
RUN apt install php-fpm -y
RUN apt install php-mysqli -y
RUN apt install curl -y
# RUN wget https://wordpress.org/latest.tar.gz \
#    && cd /var/www \
#    && tar -xzf /latest.tar.gz \
#    && chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.


# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#    && chmod +x wp-cli.phar \
#    && mv wp-cli.phar /usr/local/bin/wp
# RUN PHP-FPM SERVICE IN THE FOREGROUND USING FLAG -F
# Force to run in background and ignore
#CMD ["php-fpm8.2", "-F"]

COPY script.sh .

RUN chmod +x script.sh

# REPLACE BY EXECUTE THE SCRIPT AS THE LAST COMMAND
# BECAUSE IF WE DONT RUN THE WP CLI AND PHP IN THE SAME SCRIPT AS LAST CMD
# OUR DOCKER VOLUME MOUNT WILL OVERWRITE EVERYTHING IN VAR/WWW/HTML
# OUR WP FILES WILL BE DELETED
CMD ["./script.sh"]