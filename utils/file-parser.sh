#!/bin/bash
#while IFS='' read -r line || [[ -n "$line" ]]; do
#    echo "Text read from file: $line"
#done < "$1"
export METEOR_VERSION=$(cat /opt/src/.meteor/release | awk -F'@' '{print $2}')
