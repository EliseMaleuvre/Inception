FROM debian:latest

RUN apt-get update 
RUN apt upgrade
RUN apt install wget -y
RUN apt install vim -y 
RUN apt install php-fpm 
# RUN php-mysql mariadb-client -y
#&& wget https://wordpress.org/latest.tar.gz \
 #   && cd /var/www \
  #  && tar -xvzf /latest.tar.gz \
   # && chown -R root:root /var/www/wordpress 

#COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# RUN PHP-FPM SERVICE IN THE FOREGROUND USING FLAG -F
# Force to run in background and ignore
CMD ["php-fpm8.2", "-F"]