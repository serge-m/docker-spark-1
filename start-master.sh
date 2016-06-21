#!/usr/bin/env bash
docker run \
  -i \
  -d \
  -t \
  --net spark_nw \
  -p 38080:8080 \
  -p 34040:4040 \
  -p 37077:7077 \
  --hostName sparkMaster \
  samuelsmal/docker-ubuntu-spark:0.1 \
  /usr/bin/supervisord --configuration=/opt/conf/master.conf

