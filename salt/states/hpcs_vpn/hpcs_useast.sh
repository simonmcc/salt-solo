#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f $0))

python $SCRIPTPATH/juniperncprompt.py --nc-path $SCRIPTPATH --cert $SCRIPTPATH/ssl-useast.crt --login-path /dana-na/auth/url_0/login.cgi --realm 2FA useast.vpn.hpcloud.net
