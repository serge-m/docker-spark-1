#!/usr/bin/env bash
#export SPARK_MASTER_IP=`awk 'NR==1 {print $1}' /etc/hosts`
#export SPARK_LOCAL_IP=`awk 'NR==1 {print $1}' /etc/hosts`
$SPARK_HOME/sbin/start-master.sh --properties-file /home/root/spark-defaults.conf "$@"
/bin/bash
