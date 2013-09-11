#!/bin/sh  
# Install the W3C HTML validator
cd ~/travis-tmp
wget http://switch.dl.sourceforge.net/project/openjade/opensp/1.5.2/OpenSP-1.5.2.tar.gz
tar -xzf OpenSP-1.5.2.tar.gz
cd ~/travis-tmp/OpenSP-*
./configure --quiet --enable-http --disable-doc-build
make --silent
make --silent install