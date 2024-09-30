#!/bin/sh
cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

mkdir -p /run/php

chown -R www-data:www-data /run/php

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=inception --dbuser=emgarcia --dbpass="$MARIADB_PASSWORD" --dbhost=mariadb --allow-root
./wp-cli.phar user create "$WP_USER_NAME" "$WP_USER_EMAIL" --role=author --user_pass="$WP_USER_PASSWORD" --allow-root
./wp-cli.phar core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root

./wp-cli.phar theme install rainfall --activate --allow-root

/usr/sbin/php-fpm7.4 -F
