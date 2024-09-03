#!/bin/sh
cd /var/www/html

#check existing wordpress
# if [ -f "/wordpress/wp.phar-config.php" ]; 
# then
#     wp.phar config delete --path=/wordpress/
#     rm -rf /wordpress/* /usr/local/bin/wp.phar
# fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url="localhost" --title="$WP_TITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --allow-root
# ./wp-cli.phar user create "$WP_USER_NAME" "$WP_USER_EMAIL" --role=author --user_pass="$WP_USER_PASSWORD" --allow-root

./wp-cli.phar theme install rainfall --activate --allow-root

php-fpm8.2 -F
