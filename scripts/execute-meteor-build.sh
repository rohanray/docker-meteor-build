#!/bin/sh

echo "[+5+] START: Executing meteor build command"
apt-get -qq update 
apt-get -q install -y python make g++
cd /opt/src
meteor npm install
meteor build --directory /opt/dist --architecture os.linux.x86_64 --verbose
rm /usr/local/bin/meteor && rm -rf ~/.meteor
apt-get -q purge -y python make g++
apt-get -q remove --purge -y python make g++
echo "[+5+] FIN: Executing meteor build command"