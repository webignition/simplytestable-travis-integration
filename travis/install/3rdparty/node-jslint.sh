#!/bin/sh  
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration
# Install node-jslint

# Install nodejs
sudo apt-get install python-software-properties python g++ make
echo "yes" | sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs 
sudo mkdir /usr/share/node-jslint && cd /usr/share/node-jslint && sudo npm install jslint@0.2.0

# Test node-jslint
/usr/bin/nodejs /usr/share/node-jslint/node_modules/jslint/bin/jslint.js /home/travis/build/webignition/simplytestable-travis-integration/travis/sample.js