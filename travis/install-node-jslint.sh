#!/bin/sh  
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration
# Install node-jslint

# Install nodejs
sudo apt-get install python-software-properties python g++ make 
sudo add-apt-repository ppa:chris-lea/node.js
#sudo apt-get update
#sudo apt-get install nodejs

# See if npm is available

# Check installed node version (did we get the latest, it should have npm but the latest build said otherwise)
#node -v
#npm -v
