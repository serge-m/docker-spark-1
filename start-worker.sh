#!/usr/bin/env bash
docker run -d -t -P --link spark_master:spark_master samuelsmal/docker-ubuntu-spark-cv:1.0 /home/root/start-worker.sh "$@"
