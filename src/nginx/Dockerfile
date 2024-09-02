FROM debian:latest

RUN apt update && apt install nginx -y

COPY default /etc/nginx/sites-available/.

CMD [ "nginx", "-g", "daemon off;" ]
