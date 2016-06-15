#!/usr/bin/env bash
docker run \
  -i \
  -d \
  -t \
  --net spark_nw \
  -p 8080:8080 \
  -p 4040:4040 \
  -p 7077:7077 \
  --name master \
  samuelsmal/docker-ubuntu-spark:0.1 \
  /usr/bin/supervisord --configuration=/opt/conf/master.conf

