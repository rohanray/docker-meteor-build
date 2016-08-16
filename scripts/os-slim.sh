#!/bin/sh

echo "[+4+] START: Slimming down OS"
apt-get -qq purge -y gcc libc6-dev make build-essential libssl-dev python
apt-get -qq remove --purge -y gcc libc6-dev make build-essential libssl-dev python
return_code $?
apt-get -qq clean -y
apt-get -qq autoclean -y
apt-get -qq autoremove -y
return_code $?
rm -rf /var/lib/apt/lists/*
return_code $?
cp -R /usr/share/locale/en\@* /tmp/ && rm -rf /usr/share/locale/* && mv /tmp/en\@* /usr/share/locale/
rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man /usr/share/locale /usr/share/zoneinfo /var/cache/debconf/*-old
rm -rf /var/lib/cache /var/lib/log
rm -rf /tmp/*

echo "[+4+] FIN: Slimming down OS"