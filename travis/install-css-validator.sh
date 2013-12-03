#!/bin/sh  
# Note to self: Travis project root is /home/travis/build/<repo>
# e.g. /home/travis/build/webignition/simplytestable-travis-integration
# Install the W3C CSS validator
sudo apt-get update
sudo apt-get install ant cvs openjdk-7-jdk
sudo mkdir /usr/share/css-validator
cd /usr/share/css-validator
sudo CVSROOT=:pserver:anonymous:anonymous@dev.w3.org:/sources/public cvs -q checkout 2002/css-validator
cd 2002/css-validator/
sudo sed -i 's/http:\/\/about.validator.nu\/htmlparser\/htmlparser-1.3.1.zip/ftp:\/\/ftp.linux.org.tr\/gentoo\/distfiles\/htmlparser-1.3.1.zip/g' build.xml
sudo ant -q jar