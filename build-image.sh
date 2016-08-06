#!/usr/bin/env bash
docker build -t sergem/docker-ubuntu-spark:$(git rev-parse --short HEAD) .
