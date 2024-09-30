all: volume up

volume:
	mkdir -p /home/emgarcia/data/wordpress /home/emgarcia/data/mariadb

up:
	docker compose up --build
down:
	docker compose down
fclean: down
	sudo rm -rf /home/emgarcia/data/wordpress /home/emgarcia/data/mariadb
	sudo docker volume rm $(shell docker volume ls -q)
	sudo docker rmi -f $(shell docker images -qa)
	sudo docker system prune -a
re: fclean all
