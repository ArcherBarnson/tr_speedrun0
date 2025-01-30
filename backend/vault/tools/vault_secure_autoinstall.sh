#!/bin/sh

curl -fsSL https://releases.hashicorp.com/vault/1.18.3/vault_1.18.3_linux_amd64.zip -o /tmp/vault_1.18.3_linux_amd64.zip

curl -fsSL https://releases.hashicorp.com/vault/1.18.3/vault_1.18.3_SHA256SUMS -o /tmp/vault_shasums

grep -n "linux_amd64" /tmp/vault_shasums | cut -c 3- | head -c 64 > /tmp/source

sha256sum /tmp/vault_1.18.3_linux_amd64.zip | head -c 64 > /tmp/downloaded

diff  /tmp/downloaded /tmp/source

if [ $? -eq 0 ]
then
	echo "vault.zip integrity confirmed, unpacking..."
	unzip /tmp/vault_1.18.3_linux_amd64.zip
	mv vault /usr/local/bin
else
	echo "[SECURITY ALERT] vault.zip integtrity was not verified, your source may be compromised !"
fi

echo "Cleaning up..."
rm -rf /tmp/vault.zip /tmp/vault_shasums /tmp/downloaded /tmp/source
