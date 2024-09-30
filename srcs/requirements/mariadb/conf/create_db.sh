#!/bin/bash

echo "CREATE DATABASE inception;" >> ./etc/mysql/init.sql
echo "CREATE USER 'emgarcia'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" >> ./etc/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON *.* TO 'emgarcia'@'%' WITH GRANT OPTION;" >> ./etc/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> ./etc/mysql/init.sql

mysqld_safe
