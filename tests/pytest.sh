#!/usr/bin/env bash

spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master spark://172.17.0.2:27077 \
  --executor-memory 2G \
  --total-executor-cores 2 \
  $SPARK_HOME/examples/target/spark-examples_2.10-1.6.1.jar \
  1000


