#!/bin/sh  
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration
# Create nginx config for core app

sudo cp /home/travis/build/webignition/simplytestable-travis-integration/travis/config/nginx/sites-available/app.integration.simplytestable.com.conf /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/app.integration.simplytestable.com.conf /etc/nginx/sites-enabled/app.integration.simplytestable.com.conf

ls -la /etc/nginx/sites-available
ls -la /etc/nginx/sites-enabled
sudo service nginx reload
