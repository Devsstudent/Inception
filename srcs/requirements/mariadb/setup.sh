#!/bin/bash

service mariadb start 

echo "that started"

mysql -u root -p$SQL_ROOT_PASSWORD
mysql -u root -p$SQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -u root -p$SQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS $SQL_USER@'localhost' IDENTIFIED BY $SQL_PASSWORD;"
mysql -u root -p$SQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%' IDENTIFIED BY $SQL_PASSWORD;"
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

service mariadb stop

cat /etc/mysql/mycnf

exec mysqld



