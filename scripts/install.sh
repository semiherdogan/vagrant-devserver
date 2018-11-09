#!/usr/bin/env bash

apt install curl zip

sh install/apache.sh
sh install/mysql.sh
# mysql_secure_installation
sh install/mongodb.sh
sh install/redis.sh
sh install/memcached.sh
sh install/node.sh
sh install/php.sh
sh install/composer.sh

# SELECT user,authentication_string,plugin,host FROM mysql.user;
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'"
mysql -u root -proot -e "FLUSH PRIVILEGES"

a2enmod proxy_fcgi setenvif alias rewrite
a2enconf php7.2-fpm
a2enconf php5.6-fpm
