#!/bin/sh  
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration
# Install SimplyTestable core application
mkdir ~/simplytestable/app.simplytestable.com && cd ~/simplytestable/app.simplytestable.com 

git clone git@github.com:webignition/app.simplytestable.com.git .