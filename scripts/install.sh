#!/usr/bin/env bash

apt install curl zip

sh install/apache.sh

sh install/mysql.sh
# sh install/mongodb.sh
# sh install/redis.sh
# sh install/memcached.sh

sh install/php.sh
sh install/composer.sh

# sh install/node.sh
# sh install/yarn .sh

mysql --user="root" -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'secret';"
mysql --user="root" --password="secret" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;"
mysql --user="root" --password="secret" -e "CREATE USER 'ubuntu18'@'0.0.0.0' IDENTIFIED BY 'secret';"
mysql --user="root" --password="secret" -e "CREATE USER 'ubuntu18'@'%' IDENTIFIED BY 'secret';"
mysql --user="root" --password="secret" -e "GRANT ALL PRIVILEGES ON *.* TO 'ubuntu18'@'0.0.0.0' WITH GRANT OPTION;"
mysql --user="root" --password="secret" -e "GRANT ALL PRIVILEGES ON *.* TO 'ubuntu18'@'%' WITH GRANT OPTION;"
mysql --user="root" --password="secret" -e "FLUSH PRIVILEGES;"

a2enmod proxy_fcgi actions setenvif alias rewrite
a2enconf php7.2-fpm
a2enconf php5.6-fpm
