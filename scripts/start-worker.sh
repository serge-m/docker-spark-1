#!/usr/bin/env bash
# TODO fix the master ip and port... too hardcoded now
cd /home/root/spark
export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
./bin/spark-class org.apache.spark.deploy.worker.Worker \
	spark://$SPARK_MASTER_PORT_27077_TCP_ADDR:27077 \
	--properties-file /home/root/spark-defaults.conf \
	-i $SPARK_LOCAL_IP \
	"$@"
