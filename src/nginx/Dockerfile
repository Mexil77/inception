FROM debian:buster

RUN apt update && apt install nginx openssl -y

RUN mkdir -p /run/nginx

COPY config/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt -subj "/CN=emgarcia.42.fr" -days 365

CMD [ "nginx", "-g", "daemon off;" ]
