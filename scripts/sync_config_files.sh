#!/usr/bin/env bash

CURRENT_DIR=$(dirname "$0")

# Apache config
rm /etc/apache2/apache2.conf_old
mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf_old
cp $CURRENT_DIR/../conf/apache2.conf /etc/apache2/

# Mysql config
rm /etc/mysql/mysql.conf.d/mysqld.cnf_old
mv /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf_old
cp $CURRENT_DIR/../conf/mysqld.cnf /etc/mysql/mysql.conf.d/

# Redis config
rm /etc/redis/redis.conf_old
mv /etc/redis/redis.conf /etc/redis/redis.conf_old
cp $CURRENT_DIR/../conf/redis.conf /etc/redis/

# Memcached config
rm /etc/memcached.conf_old
mv /etc/memcached.conf /etc/memcached.conf_old
cp $CURRENT_DIR/../conf/memcached.conf /etc/

# Apache vhost config
rm -rf /etc/apache2/sites-enabled_old
mv /etc/apache2/sites-enabled /etc/apache2/sites-enabled_old
cp $CURRENT_DIR/../sites-enabled /etc/apache2/


# systemctl restart apache2
# systemctl restart mysql
# systemctl restart redis
# /etc/init.d/memcached restart
