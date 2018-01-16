#!/bin/sh
echo $1

/usr/sbin/apache2 > /dev/null
/opt/SenchaSDKTools-2.0.0-beta3/sencha $1