#!/usr/bin/env bash
docker run \
  -i \
  -d \
  -t \
  -P \
  --net spark_nw \
  --name sparkShell \
  samuelsmal/docker-ubuntu-spark:0.1 \
  /home/root/spark-shell.sh \
  "$@"
