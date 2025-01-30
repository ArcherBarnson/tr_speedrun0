#################################
#	WAF DOCKERFILE		#
#################################

FROM	debian:bullseye-slim

RUN	apt update -y && apt upgrade -y

#Install all required tools for running Modsecurity3
RUN	apt-get install g++ gcc make cmake automake autoconf pkg-config libtool \
		curl wget tar git \
		libpcre3-dev libxml2-dev libcurl4-gnutls-dev libyajl-dev \
		flex bison -y

#Get the autoinstall script and run it (keeping the Dockerfile short and clear)
COPY	tools/modsec-autoinstall.sh ./

RUN	sh ./modsec-autoinstall.sh

EXPOSE	80 443

ENTRYPOINT	["/bin/sh"]
