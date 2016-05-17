#!/usr/bin/env bash
docker run -i -d -t -P --name spark_shell samuelsmal/docker-ubuntu-spark:0.1 /home/root/spark-shell.sh "$@"
