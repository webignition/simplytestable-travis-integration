#!/bin/sh  
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration

sudo cat /etc/hosts
sudo echo "127.0.0.1 app.simplytestable.com" > /etc/hosts
sudo cat /etc/hosts