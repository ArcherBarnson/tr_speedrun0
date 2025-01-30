FROM	debian:bullseye-slim

RUN	apt update -y && apt upgrade -y

RUN	apt-get install -y grep curl ca-certificates unzip

COPY	./tools/vault_secure_autoinstall.sh ./

RUN	chmod +x ./vault_secure_autoinstall.sh

RUN	./vault_secure_autoinstall.sh

RUN	vault --version

EXPOSE	8200

ENTRYPOINT	["vault", "server", "-dev"]
