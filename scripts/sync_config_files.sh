#!/usr/bin/env bash

# CURRENT_DIR=$(dirname "$0")
CURRENT_DIR="/home/vagrant/scripts"

# Apache config
if [ -d "/etc/apache2/" ]
then
    cp $CURRENT_DIR/../conf/apache2.conf /etc/apache2/
else
    echo "Apache config file not found."
fi

# Mysql config
if [ -d "/etc/mysql/mysql.conf.d/" ]
then
    cp $CURRENT_DIR/../conf/mysqld.cnf /etc/mysql/mysql.conf.d/
else
    echo "Mysql config folder not exists."
fi

# Redis config
if [ -d "/etc/redis/" ]
then
    cp $CURRENT_DIR/../conf/redis.conf /etc/redis/
else
    echo "Redis config folder not exists."
fi

# Memcached config
cp $CURRENT_DIR/../conf/memcached.conf /etc/

# Apache vhost config
if [ -d /etc/apache2/sites-enabled/ ]
then
    rm -rf /etc/apache2/sites-enabled/*
	cp -r $CURRENT_DIR/../sites-enabled/ /etc/apache2/
else
    echo "Apache sites-enabled folder not exists."
fi

# Apache config
if [ -d /etc/apache2/ ]
then
    cp $CURRENT_DIR/../conf/php56.conf /etc/apache2/
else
    echo "Apache folder not exists."
fi

systemctl restart apache2
systemctl restart mysql
/etc/init.d/memcached restart
# systemctl restart redis
