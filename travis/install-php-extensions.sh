#!/bin/sh
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration
# Install required PHP extensions
# /home/travis/.phpenv/shims/php -v

# Install memcache extension and verify installation
sudo apt-get update
sudo apt-get install php5-dev
wget http://pecl.php.net/get/memcache-2.2.7.tgz
tar -zxf memcache-2.2.7.tgz
sh -c "cd memcache-2.2.7 && phpize && ./configure && make --quiet && sudo make --quiet install"
echo "extension=memcache.so" >> `/home/travis/.phpenv/shims/php --ini | grep "Loaded Configuration" | sed -e "s/.*:\s*//"`  
/home/travis/.phpenv/shims/php -r 'new \Memcache;'
