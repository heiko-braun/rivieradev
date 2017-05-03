#!/bin/sh

USER=alice
PASS=password

RESULT=`curl -s --data "grant_type=password&client_id=curl&username=${USER}&password=${PASS}" http://localhost:9095/auth/realms/RivieraDev/protocol/openid-connect/token`
TOKEN=`echo $RESULT | sed 's/.*access_token":"//g' | sed 's/".*//g'`

echo $TOKEN
