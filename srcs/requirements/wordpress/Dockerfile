FROM debian:bullseye

RUN apt update && apt install php-fpm php-mysql curl -y

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY conf/script.sh .

RUN chmod +x script.sh

CMD [ "./script.sh" ]
