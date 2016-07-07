#!/usr/bin/env bash
docker run \
  -d \
  --net spark_nw \
  -v $(pwd)/data:$(pwd)/data \
  samuelsmal/docker-ubuntu-spark:$(git describe --tags --dirty) \
  /usr/bin/supervisord --configuration=/opt/conf/slave.conf

