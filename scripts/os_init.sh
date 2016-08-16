#!/bin/sh

echo "[+0+] START: Sanitizing OS of junk"

# sanitizing OS
apt-get -qq purge -y `apt-mark showauto`
apt-get -qq remove --purge -y `apt-mark showauto`
return_code $?

apt-get -qq clean -y
apt-get -qq autoclean -y
apt-get -qq autoremove -y
return_code $?

echo "[+0+] FIN: Sanitizing OS of junk"

echo "[+1+] START: Updating OS"

apt-get -qq update
return_code $?

echo "[+1+] FIN: Updating OS"

echo "[+2+] START: Installing OS package dependencies"

apt-get -qq install -y --no-install-recommends gcc libc6-dev make build-essential libssl-dev python git wget curl ca-certificates sudo bzip2 apt-utils
return_code $?

echo "[+2+] FIN: Installing OS package dependencies"

