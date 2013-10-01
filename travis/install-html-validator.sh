#!/bin/sh  
# Install the W3C HTML validator

# Install OpenSP dependency
cd ~/travis-tmp
wget http://switch.dl.sourceforge.net/project/openjade/opensp/1.5.2/OpenSP-1.5.2.tar.gz
tar -xzf OpenSP-1.5.2.tar.gz
cd ~/travis-tmp/OpenSP-*
./configure --quiet --enable-http --disable-doc-build
make --silent
make --silent install

cd ~/travis-tmp
rm -Rf OpenSP*

# Install tidyp dependency
wget http://github.com/downloads/petdance/tidyp/tidyp-1.04.tar.gz
tar -xzf tidyp-1.04.tar.gz
cd tidyp-1.04
./configure --quiet
make --silent
make --silent install
ldconfig

cd ~/travis-tmp
rm -Rf tidyp*

# Install required perl modules
curl -L http://cpanmin.us | perl - --sudo App::cpanminus
cpanm Bundle::W3C::Validator

# Retrieve validator source and put it where it belongs
mkdir /usr/local/validator && cd /usr/local/validator
wget http://validator.w3.org/validator.tar.gz && tar -xzf validator*
wget http://validator.w3.org/sgml-lib.tar.gz && tar -xzf sgml*

cp -R validator-1.1/htdocs/* validator-1.3/htdocs/
mv validator-1.3/htdocs validator-1.3/share validator-1.3/httpd/cgi-bin /usr/local/validator

#ls -la /usr/local/validator/htdocs
#ls -la /usr/local/validator/share
#ls -la /usr/local/validator/cgi-bin

# Install validator.nu HTML5 validator
apt-get update
apt-get install openjdk-7-jdk mercurial subversion
mkdir /usr/local/html5-validator && cd /usr/local/html5-validator
hg clone https://bitbucket.org/validator/build build
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/ && python build/build.py all
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/ && python build/build.py build
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/ && python build/build.py test

# Create and start HTML5 validator service
sudo cp ~/travis/html5-validator-service.conf /etc/init/html5-validator.conf
sudo service html5-validator start

# Configure validator
mkdir /etc/w3c
cp -R /usr/local/validator/htdocs/config/* /etc/w3c

# Test HTML4 strict validation
/usr/local/validator/cgi-bin/check output=json fragment='<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"><html><head><title>Hello World!</title></head><body><p>Foo</p></body></html>'

