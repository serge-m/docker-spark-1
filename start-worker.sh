#!/usr/bin/env bash
docker run -d -t --link sparkMaster:sparkMaster samuelsmal/docker-ubuntu-spark:0.1 /home/root/start-worker.sh "$@"

