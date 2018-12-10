#!/usr/bin/env bash

CURRENT_DIR=$(dirname "$0")

# Apache config
cp $CURRENT_DIR/../conf/apache2.conf /etc/apache2/

# Mysql config
cp $CURRENT_DIR/../conf/mysqld.cnf /etc/mysql/mysql.conf.d/

# Redis config
# cp $CURRENT_DIR/../conf/redis.conf /etc/redis/

# Memcached config
cp $CURRENT_DIR/../conf/memcached.conf /etc/

# Apache vhost config
rm -rf /etc/apache2/sites-enabled/*
cp -r $CURRENT_DIR/../sites-enabled/ /etc/apache2/

# Apache config
cp $CURRENT_DIR/../conf/php56.conf /etc/apache2/

systemctl restart apache2
systemctl restart mysql
/etc/init.d/memcached restart
systemctl restart redis
