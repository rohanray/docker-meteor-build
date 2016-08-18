#!/bin/bash
export METEOR_VERSION=$(cat /opt/src/.meteor/release | awk -F'@' '{print $2}')
