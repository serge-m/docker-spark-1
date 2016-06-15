#!/usr/bin/env bash
$SPARK_HOME/sbin/start-slave.sh \
	spark://sparkMaster:7077 \
	--properties-file /home/root/spark-defaults.conf \
	"$@"
