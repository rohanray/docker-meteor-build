#!/bin/sh

return_code () {
  if [ ! "$1" -eq 0 ]; then
    echo "[!] Process bombed. Terminating..."
    exit 1
  fi
}

. /meteor-docker-scripts/file-parser.sh

echo "[+0+] START: Installing Meteor $METEOR_VERSION"

curl -sL https://install.meteor.com?release=$METEOR_VERSION | /bin/sh
return_code $?

echo "[+0+] FIN: Installing Meteor"

echo "[+1+] START: Executing meteor build command $METEOR_VERSION"
apt-get -qq update 
apt-get -qq install -y python make g++
cd /opt/src
meteor npm install --production
meteor build /opt/dist --architecture os.linux.x86_64 --verbose
cd /opt/dist
ls -la
echo "[+1+] FIN: Executing meteor build command"

echo "[+2+] START: Slimming down OS"

apt-get -qq purge -y gcc libc6-dev make build-essential libssl-dev python g++
apt-get -qq remove --purge -y gcc libc6-dev make build-essential libssl-dev python g++
return_code $?
apt-get -qq clean -y
apt-get -qq autoclean -y
apt-get -qq autoremove -y
return_code $?

cp -R /usr/share/locale/en\@* /tmp/ && rm -rf /usr/share/locale/* && mv /tmp/en\@* /usr/share/locale/
rm /usr/local/bin/meteor && rm -rf ~/.meteor /opt/src /meteor-docker-scripts /var/lib/apt/lists/*
rm -rf /usr/share/doc /usr/share/doc-base /usr/share/man /usr/share/locale /usr/share/zoneinfo /var/cache/debconf/*-old /var/lib/cache /var/lib/log /tmp/*

echo "[+2+] FIN: Slimming down OS"
