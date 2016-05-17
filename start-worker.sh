#!/usr/bin/env bash
docker run -d -t -P --link spark_master:spark_master samuelsmal/docker-ubuntu-spark:0.1 /home/root/start-worker.sh "$@"
