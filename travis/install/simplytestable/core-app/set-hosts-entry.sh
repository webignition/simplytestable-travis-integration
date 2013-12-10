#!/bin/sh  
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration

echo "127.0.0.1 app.integration.simplytestable.com" | sudo tee --append /etc/hosts