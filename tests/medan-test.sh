#!/usr/bin/env bash

spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master spark://medan.test.contovista.com:23077 \
  --executor-memory 2G \
  --total-executor-cores 2 \
  $SPARK_HOME/examples/target/spark-examples_2.10-1.6.1.jar \
  1000


