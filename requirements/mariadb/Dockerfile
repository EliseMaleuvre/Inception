FROM debian:latest

RUN apt update -y 
RUN apt upgrade -y
RUN apt install mariadb-server -y 
RUN apt install vim -y

# COPY THE MYSQL CONFIGURATION FILE :
# THIS FILE CONTAINS THE CONFIGURATION FOR THE MYSQL SERVER
#COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# COPY THE MYSQL SCRIPT CONFIGURATION FILE TO MODIFY IT
# THIS FILE CONTAINS THE CONFIGURATION OF THE MYSQL SCRIPT
#COPY tools/mysql.sh /var/mysql.sh

#RUN chmod +x /var/mysql.sh

CMD ["/bin/sh"]