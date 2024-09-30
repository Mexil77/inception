FROM debian:bullseye

RUN apt update && apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY conf/init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

CMD [ "mysqld" ]
