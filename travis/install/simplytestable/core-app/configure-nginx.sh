#!/bin/sh  
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration
# Create nginx config for core app

sudo cp /home/travis/build/webignition/simplytestable-travis-integration/travis/config/nginx/sites-available/app.simplytestable.com /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/app.simplytestable.com /etc/nginx/sites-enabled/app.simplytestable.com