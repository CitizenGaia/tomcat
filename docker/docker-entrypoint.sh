#!/bin/bash
set -e

. /verify-container.sh

REDIRECT_PORT=$(expr $LISTEN_PORT + 443 - 080)
sed -i "s@<Connector port=\"-1\" protocol=\"HTTP/1.1\" connectionTimeout=\"-1\" redirectPort=\"-1\" />@<Connector port=\"$LISTEN_PORT\" protocol=\"HTTP/1.1\" connectionTimeout=\"20000\" redirectPort=\"$REDIRECT_PORT\" />@" $CATALINA_HOME/conf/server.xml

cat /Manifest/version.properties

echo -e "[$1] docker container" >> $LOG_VOLUME/docker-entrypoint.log
if [ "$1" = 'run' ]; then
    echo -e "[$(date -Iseconds)] Booting new docker container" >> $LOG_VOLUME/docker-entrypoint.log
    cat /Manifest/version.properties >> $LOG_VOLUME/docker-entrypoint.log
    echo -e "\n[$(date -Iseconds)]\n" >> $LOG_VOLUME/docker-entrypoint.log
    exec ${TOMCAT_HOME}/bin/catalina.sh run > /dev/null 2>&1 #All the output is also written to normal log file.
fi
exec "$@"
