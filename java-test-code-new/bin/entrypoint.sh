#!/usr/bin/env bash
set -x

JMX_PORT=9010
HOST="0.0.0.0"

java \
  -Dsun.management.jmxremote.level=FINEST \
  -Dsun.management.jmxremote.handlers=java.util.logging.ConsoleHandler \
  -Djava.util.logging.ConsoleHandler.level=FINEST \
  -Dcom.sun.management.jmxremote.local.only=false \
  -Dcom.sun.management.jmxremote.ssl=false \
  -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.port=$JMX_PORT \
  -Dcom.sun.management.jmxremote.rmi.port=$JMX_PORT \
  -Dcom.sun.management.jmxremote.host=$HOST \
  -Djava.rmi.server.hostname=192.168.56.101 \
  -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 \
  -javaagent:/opt/app/jmx_prometheus_javaagent-0.3.1.jar=8080:/opt/app/config.yaml \
  -jar /opt/app/app.jar

