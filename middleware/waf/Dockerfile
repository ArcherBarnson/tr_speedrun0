FROM	debian:bullseye

RUN	apt update -y && apt upgrade -y

RUN	apt-get install g++ gcc make cmake automake autoconf pkg-config libtool \
		curl wget tar git \
		libpcre3-dev libxml2-dev libcurl4-gnutls-dev libyajl-dev \
		flex bison -y

COPY	tools/modsec-autoinstall.sh ./

RUN	sh ./modsec-autoinstall.sh

ENTRYPOINT	["/bin/sh"]
