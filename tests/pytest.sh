#!/usr/bin/env bash

SPARK_EXAMPLES_JAR_PATH=$SPARK_HOME/examples/target/spark-examples_2.10-1.6.1.jar

if [ ! -f $SPARK_EXAMPLES_JAR_PATH ]; then
    SPARK_EXAMPLES_JAR_PATH=$SPARK_HOME/lib/spark-examples-1.6.1-hadoop2.6.0.jar
fi

$SPARK_HOME/bin/spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master spark://localhost:37077 \
  --executor-memory 8G \
  $SPARK_EXAMPLES_JAR_PATH \
  1000
