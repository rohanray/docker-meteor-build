#!/bin/sh

return_code () {
  if [ ! "$1" -eq 0 ]; then
    echo "[!] Process bombed. Terminating..."
    exit 1
  fi
}

. /meteor-docker-scripts/file-parser.sh

echo "[+3+] START: Installing Meteor $METEOR_VERSION"

curl -sL https://install.meteor.com?release=$METEOR_VERSION | /bin/sh
return_code $?

echo "[+3+] FIN: Installing Meteor"

echo "[+4+] START: Executing meteor build command $METEOR_VERSION"
apt-get -qq update 
apt-get -qq install -y python make g++
cd /opt/src
meteor npm install --production
meteor build /opt/dist --architecture os.linux.x86_64 --verbose
cd /opt/dist
ls -la
rm /usr/local/bin/meteor && rm -rf ~/.meteor /opt/src /meteor-docker-scripts
apt-get -qq purge -y python make g++
apt-get -qq remove --purge -y python make g++
echo "[+4+] FIN: Executing meteor build command"

echo "[+5+] START: Slimming down OS"
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

echo "[+5+] FIN: Slimming down OS"

