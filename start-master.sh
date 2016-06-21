#!/usr/bin/env bash
docker run \
  -i \
  -d \
  -t \
  --net spark_nw \
  -p 38080:8080 \
  -p 34040:4040 \
  -p 37077:7077 \
  --name sparkMaster \
  --hostname sparkMaster \
  samuelsmal/docker-ubuntu-spark:$(git describe --tags --dirty) \
  /usr/bin/supervisord --configuration=/opt/conf/master.conf

