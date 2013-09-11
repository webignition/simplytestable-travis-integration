#!/bin/sh  
# Install the W3C HTML validator
cd ~/travis-tmp
#wget http://switch.dl.sourceforge.net/project/openjade/opensp/1.5.2/OpenSP-1.5.2.tar.gz
#tar -xzf OpenSP-1.5.2.tar.gz
#cd ~/travis-tmp/OpenSP-*
#./configure --quiet --enable-http --disable-doc-build
#make --silent
#make --silent install

wget http://github.com/downloads/petdance/tidyp/tidyp-1.04.tar.gz
tar -xzf tidyp-1.04.tar.gz
cd tidyp-1.04
./configure --quiet
make --silent
make --silent install
ldconfig

curl -L http://cpanmin.us | perl - --sudo App::cpanminus
cpanm Bundle::W3C::Validator
