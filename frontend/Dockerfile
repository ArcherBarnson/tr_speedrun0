FROM	node:slim

#workdir path example, may change later
WORKDIR	/usr/src/app/

COPY	./package*.json ./

RUN	npm install

RUN	npm run build

#no need to keep the container running,
#	the WAF midddleware container will do
#	all the file serving, request forwarding
#	after the front app is built
