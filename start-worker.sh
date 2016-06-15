#!/usr/bin/env bash
docker run \
  -d \
  --net spark_nw \
  samuelsmal/docker-ubuntu-spark:0.1 \
  /usr/bin/supervisord --configuration=/opt/conf/slave.conf

