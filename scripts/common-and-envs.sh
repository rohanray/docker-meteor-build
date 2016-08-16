#!/bin/sh

return_code () {
  if [ ! "$1" -eq 0 ]; then
    echo "[!] Process bombed. Terminating..."
    exit 1
  fi
}