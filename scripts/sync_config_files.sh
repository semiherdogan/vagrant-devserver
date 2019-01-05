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

# Apache vhost config
if [ -d /etc/apache2/sites-enabled/ ]
then
    rm -rf /etc/apache2/sites-enabled/*
	cp -r $CURRENT_DIR/../sites-enabled/ /etc/apache2/

    echo "Restarting apache2 ..."
    systemctl restart apache2
else
    echo "Apache sites-enabled folder not exists."
fi

# Mysql config
if [ -d "/etc/mysql/mysql.conf.d/" ]
then
    cp $CURRENT_DIR/../conf/mysqld.cnf /etc/mysql/mysql.conf.d/

    echo "Restarting mysql ..."
    systemctl restart mysql
else
    echo "Mysql config folder not exists."
fi

# Memcached config
if [ -e /etc/init.d/memcached ]
then
    cp $CURRENT_DIR/../conf/memcached.conf /etc/

    echo "Restarting memcached ..."
    /etc/init.d/memcached restart
else
    # echo "Memcached not exists."
fi

# Redis config
if [ -d "/etc/redis/" ]
then
    cp $CURRENT_DIR/../conf/redis.conf /etc/redis/
    # systemctl restart redis
else
    # echo "Redis config folder not exists."
fi

# PHP56 config
if [ -d /etc/apache2/ ]
then
    cp $CURRENT_DIR/../conf/php56.conf /etc/apache2/
fi

# source aliases
source $CURRENT_DIR/../conf/aliases
