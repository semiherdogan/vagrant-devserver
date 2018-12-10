
#!/usr/bin/env bash

LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

apt install -y \
php7.3-cli \
php7.3-fpm \
php7.3-common \
php7.3-zip \
php7.3-mysql \
php7.3-gd \
php7.3-xml \
php7.3-mbstring \
php7.3-curl \
php7.3-mongodb \
php7.3-memcached \
php7.3-redis \
php5.6-cli \
php5.6-fpm \
php5.6-common \
php5.6-zip \
php5.6-mcrypt \
php5.6-mysql \
php5.6-gd \
php5.6-xml \
php5.6-mbstring \
php5.6-curl \
php5.6-mongodb \
php5.6-memcached \
php5.6-redis
