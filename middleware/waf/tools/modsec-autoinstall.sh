#!/bin/sh

#Get the modsec3 source
if [ ! -f /ModSecurity ] ; then
	echo "Modsec3 not found, downloading now"
	git clone --recursive --depth 1 https://github.com/owasp-modsecurity/ModSecurity ModSecurity

	#Modsec3 install following official ubuntu build reciepe
	cd ModSecurity \
	git submodule init \
	git submodule update \
	sh build.sh \
	./configure \
	make \
	make install
fi

#Install nginx + Modsec3-nginx connector install
apt-get install nginx -y

if [ ! -f /opt/ModSecurity-nginx ] ; then
	echo "Modsec3 nginx connector not found, downloading now"
	git clone --depth 1 https://github.com/owasp-modsecurity/ModSecurity-nginx /opt/ModSecurity-nginx

	cd /opt/ModSecurity-nginx \
	git submodule init \
	git submodule update \
	./configure --add-module=../ModSecurity-nginx \
	./configure --add-dynamic-module=../ModSecurity-nginx --with-compat
fi

#Back to root, download and unpack OWASP core ruleset latest
cd /

if [ ! -f /etc/nginx/modsec/crs/coreruleset-4.11.0 ] ; then
	echo "OWASP ruleset not found, downloading now"
	wget https://github.com/coreruleset/coreruleset/archive/refs/tags/v4.11.0.tar.gz
	tar -xzf v4.11.0.tar.gz
	mkdir -p /etc/nginx/modsec/crs && mv coreruleset-4.11.0 /etc/nginx/modsec/crs
fi
