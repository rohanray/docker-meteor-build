#!/bin/bash
#while IFS='' read -r line || [[ -n "$line" ]]; do
#    echo "Text read from file: $line"
#done < "$1"
export $(cat ../simple-todos/.meteor/release | awk -F'@' '{print "met_rel="$2}')
