#!/bin/sh
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration
# Install nginx and php-fpm
# /home/travis/.phpenv/shims/php -v

sudo apt-get update
sudo apt-get install php5-mysql
sudo apt-get install nginx
sudo apt-get install php5-fpm
sudo service nginx start
sudo service nginx status

sudo service php5-fpm status