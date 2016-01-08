#!/usr/bin/env bash

if [ "$#" -eq 5 ]; then

    ACCESS_KEY=$1
    SECRET_KEY=$2
    BOOTSTRAP_URL=$3
    SERVICE=$4
    HOST=$5

    RES=`/usr/bin/euserv-describe-services -I "$ACCESS_KEY" -S "$SECRET_KEY" -U "$BOOTSTRAP_URL" --filter host="$HOST" --filter service-type="$SERVICE" | awk '{print $2" "$3" "$5}'`
    echo $RES

else
    echo "Missing parameters"
fi
exit 0
