#!/usr/bin/env bash

cd /tmp

curl -sS https://getcomposer.org/installer -o composer-setup.php

php composer-setup.php --install-dir=/usr/local/bin --filename=composer
