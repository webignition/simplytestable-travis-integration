#!/bin/sh  
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration
# Install SimplyTestable core application
mkdir ~/simplytestable/www/app.integration.simplytestable.com && cd ~/simplytestable/www/app.integration.simplytestable.com 

git clone https://github.com/webignition/app.simplytestable.com.git .

mkdir app/cache/prod && chmod -R 0777 app/cache
touch app/logs/prod.log && chmod 0777 app/logs

cp /home/travis/build/webignition/simplytestable-travis-integration/travis/config/core-app/app/config/parameters.yml app/config/parameters.yml
cp src/SimplyTestable/ApiBundle/Resources/config/parameters.yml.dist.yml src/SimplyTestable/ApiBundle/Resources/config/parameters.yml
echo | /home/travis/build/webignition/simplytestable-travis-integration/composer.phar install
export SYMFONY_ENV=prod && /home/travis/.phpenv/shims/php app/console doctrine:database:create
export SYMFONY_ENV=prod && /home/travis/.phpenv/shims/php app/console doctrine:migrations:migrate --no-interaction
export SYMFONY_ENV=prod && /home/travis/.phpenv/shims/php app/console doctrine:fixtures:load --append
