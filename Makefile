all: up

volume:
	mkdir -p /home/emgarcia/data/wordpress /home/emgarcia/data/mariadb

up:
	docker compose up --build
down:
	docker compose down
fclean: down
	# docker volume rm $(shell docker volume ls -q)
	docker rmi -f $(shell docker images -qa)
	docker system prune -a
re: fclean all
