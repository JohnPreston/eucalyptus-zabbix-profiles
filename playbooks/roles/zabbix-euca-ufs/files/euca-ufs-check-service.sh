#!/usr/bin/env bash

if [ "$#" -eq 1 ]; then

    IP_BOUND=`cat /etc/eucalyptus/eucalyptus.conf | grep OPTS | grep -v \# | grep bind-addr | wc -l`

    if [ $IP_BOUND -ne 1 ]; then
	HOST="localhost"
    else
	HOST=`cat /etc/eucalyptus/eucalyptus.conf | grep OPTS | grep -v \# | grep bind-addr | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])'`
    fi

    BOOTSTRAP_URL="http://$HOST:8773/services/Empyrean"
    ACCESS_KEY='AKIAAW2IZMKARMYRCE5C'
    SECRET_KEY='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'

    SERVICE=$1
    RES=`/usr/bin/euserv-describe-services -I "$ACCESS_KEY" -S "$SECRET_KEY" -U "$BOOTSTRAP_URL" --filter host="$HOST" --filter service-type="$SERVICE" | awk '{print $2" "$3" "$5}'`
    echo $RES

else
    echo "Missing parameters"
fi
exit 0
