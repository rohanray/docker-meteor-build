#!/bin/sh

echo "[+5+] START: Executing meteor build command"
apt-get -qq update 
apt-get -qq install -y python make g++
cd /opt/src
meteor npm install
meteor build /opt/dist --architecture os.linux.x86_64 --verbose
cd /opt/dist
ls -la
rm /usr/local/bin/meteor && rm -rf ~/.meteor /opt/src /meteor-docker-scripts
apt-get -qq purge -y python make g++
apt-get -qq remove --purge -y python make g++
echo "[+5+] FIN: Executing meteor build command"
