#!/usr/bin/env bash

SPARK_EXAMPLES_JAR_PATH=$SPARK_HOME/examples/jars/spark-examples_2.11-2.0.0.jar

$SPARK_HOME/bin/spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master spark://localhost:37077 \
  --executor-memory 2G \
  --total-executor-cores 2 \
  $SPARK_EXAMPLES_JAR_PATH \
  1000
