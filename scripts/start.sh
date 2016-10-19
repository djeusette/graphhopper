#!/bin/sh

if [ -z "$OSM_FILE" ]; then
  OSM_FILE=`ls /data/*.pbf`
fi

if [ -z "${JAVA_OPTS}" ]; then
    JAVA_OPTS="$JAVA_OPTS -Xms64m -Xmx1024m -XX:MaxPermSize=256m -Djava.net.preferIPv4Stack=true"
    JAVA_OPTS="$JAVA_OPTS -server -Djava.awt.headless=true -Xconcurrentio"
    echo "Setting default JAVA_OPTS"
fi

RUN_ARGS=" -jar $HOME/*.jar jetty.resourcebase=$HOME/webapp config=$HOME/config.properties datareader.file=$OSM_FILE"

echo "JAVA_OPTS= ${JAVA_OPTS}"
echo "RUN_ARGS= ${RUN_ARGS}"

java $JAVA_OPTS $RUN_ARGS
