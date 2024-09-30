all: volume up

volume:
	mkdir -p /home/emgarcia/data/wordpress /home/emgarcia/data/mariadb

up:
	sudo docker compose -f ./srcs/docker-compose.yml up --build
down:
	sudo docker compose -f ./srcs/docker-compose.yml down
fclean: down
	sudo rm -rf /home/emgarcia/data/wordpress /home/emgarcia/data/mariadb
	sudo docker volume rm $(shell docker volume ls -q)
	sudo docker rmi -f $(shell docker images -qa)
	sudo docker system prune -a
re: fclean all
