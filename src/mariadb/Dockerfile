FROM debian:bullseye

RUN apt update && apt install mariadb-server -y

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

CMD [ "mysqld" ]
