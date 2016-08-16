#!/bin/sh

echo "[+5+] START: Executing meteor build command"
meteor npm install /opt/src
meteor build --directory /opt/dist --architecture os.linux.x86_64
echo "[+5+] FIN: Executing meteor build command"