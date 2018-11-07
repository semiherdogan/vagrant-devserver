#!/usr/bin/env bash

apt install curl zip

./install/apache.sh
./install/mongodb.sh
./install/mysql.sh
./install/php.sh
./install/redis.sh
./install/composer.sh
./install/node.sh

a2enmod proxy_fcgi setenvif alias rewrite
a2enconf php7.2-fpm
a2enconf php5.6-fpm
systemctl restart apache2

# SELECT user,authentication_string,plugin,host FROM mysql.user;
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'"
mysql -u root -e "FLUSH PRIVILEGES"
