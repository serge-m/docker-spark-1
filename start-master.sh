#!/usr/bin/env bash
docker run -i -d -t -P --name spark_master samuelsmal/docker-ubuntu-spark:0.1 /home/root/start-master.sh "$@"
