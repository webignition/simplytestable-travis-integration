#!/bin/sh  
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration
# Install SimplyTestable core application
mkdir ~/simplytestable/app.simplytestable.com && cd ~/simplytestable/app.simplytestable.com 

git clone https://github.com/webignition/app.simplytestable.com.git .

mkdir app/cache/prod && chmod -R 0777 app/cache/prod
touch app/logs/prod.log && chmod 0777 app/logs/prod.log

cp /home/travis/build/webignition/simplytestable-travis-integration/travis/config/core-app/app/config/parameters.yml app/config/parameters.yml
echo | /home/travis/build/webignition/simplytestable-travis-integration/composer.phar install
/home/travis/.phpenv/shims/php app/console doctrine:database:create
/home/travis/.phpenv/shims/php app/console doctrine:migrations:migrate --no-interaction
/home/travis/.phpenv/shims/php app/console doctrine:fixtures:load --append
