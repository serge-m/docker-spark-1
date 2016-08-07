#!/usr/bin/env bash
docker run \
  -d -i -t \
  --net spark_nw \
  sergem/docker-ubuntu-spark:$(git rev-parse --short HEAD) \
  /usr/bin/supervisord --configuration=/opt/conf/slave.conf

