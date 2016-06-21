#!/usr/bin/env bash
docker build -t samuelsmal/docker-ubuntu-spark:$(git describe --tags --dirty) .
