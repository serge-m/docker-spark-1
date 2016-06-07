#!/usr/bin/env bash
docker run -i -d -t -p 23080:8080 -p 23040:4040 -p 23077:7077 --name sparkMaster samuelsmal/docker-ubuntu-spark:0.1 /home/root/start-master.sh "$@"
