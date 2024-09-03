FROM debian:latest

RUN apt update && apt install php-fpm php-mysql curl -y

COPY www.conf /etc/php/8.2/fpm/pool.d/.
COPY script.sh .

RUN chmod +x script.sh

CMD [ "./script.sh" ]
