#!/bin/sh
echo "main-script"
PARENTDIR=`dirname $0`

. $PARENTDIR/common-and-envs.sh

. $PARENTDIR/os_init.sh

. $PARENTDIR/install_meteor.sh