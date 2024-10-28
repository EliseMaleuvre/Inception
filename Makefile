SRCS = ./srcs/requirements/nginx/Dockerfile \
		./srcs/requirements/nginx/conf/default \
		./srcs/requirements/mariadb/Dockerfile \
		./srcs/requirements/mariadb/conf/50-server.cnf \
		./srcs/requirements/mariadb/tools/init.sql \
		./srcs/requirements/wordpress/Dockerfile \
		./srcs/requirements/wordpress/script.sh \
		./srcs/requirements/wordpress/conf/www.conf

all : ${SRCS} create_volumes_repo
			docker compose -f ./srcs/docker-compose.yml up -d --build
create_volumes_repo :
					 @if [ ! -d /home/elmaleuv/data/ ]; \
					 then \
					 mkdir /home/elmaleuv/data; \
					 fi ; \
					 if [ ! -d /home/elmaleuv/data/wordpress ]; \
					 	then \
					 	mkdir /home/elmaleuv/data/wordpress; \
						fi ; \
					if [ ! -d /home/elmaleuv/data/mariadb ]; \
					then \
						mkdir /home/elmaleuv/data/mariadb; \
					fi ; 

stop :
	docker compose -f ./srcs/docker-compose.yml stop

start :
	docker compose -f ./srcs/docker-compose.yml start

restart :
	docker compose -f ./srcs/docker-compose.yml restart

down    : ${SRCS}
		docker compose -f ./srcs/docker-compose.yml down 

status    :
	docker ps -a ; docker logs nginx ; docker logs wordpress ; docker logs mariadb

clean : down

				@if [ "docker images nginx" ]; \
				then \
					docker rmi -f nginx; \
				fi ; \
				if [ "docker images mariadb" ]; \
				then \
					docker rmi -f mariadb; \
				fi ; \
				if [ "docker images wordpress" ]; \
				then \
					docker rmi -f wordpress; \
				fi ; \
				if [ "docker volume ls -f name=srcs_mariadb" ]; \
				then \
					docker volume rm -f mariadb; \
				fi ; \
				if [ "docker volume ls -f name=srcs_wordpress" ]; \
				then \
					docker volume rm -f wordpress; \
				fi ; \
				docker system prune -af;

				sudo rm -rf /home/elmaleuv/data

re : clean all

.PHONY: all create_volumes_repo down clean re status