#!/usr/bin/env bash
docker run -i -d -t -P --name spark_master samuelsmal/docker-ubuntu-spark-cv:1.0 /home/root/start-master.sh "$@"
