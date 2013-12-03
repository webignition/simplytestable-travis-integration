#!/bin/sh  
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration
# Install node-jslint

# Install nodejs
sudo apt-get install python-software-properties python g++ make --assume-yes
sudo add-apt-repository ppa:chris-lea/node.js --assume-yes
sudo apt-get update --assume-yes
sudo apt-get install nodejs --assume-yes

# See if npm is available

# Check installed node version (did we get the latest, it should have npm but the latest build said otherwise)
node -v
#npm -v
