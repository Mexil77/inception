FROM debian:bullseye

RUN apt update && apt install mariadb-server -y

COPY conf/create_db.sh .

RUN chmod 777 ./create_db.sh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.

RUN mkdir /run/mysqld

CMD [ "./create_db.sh" ]
