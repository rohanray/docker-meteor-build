#!/bin/sh

echo "[+3+] START: Installing Meteor"

curl -sL https://install.meteor.com | /bin/sh
return_code $?

echo "[+3+] FIN: Installing Meteor"
