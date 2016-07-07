#!/usr/bin/env bash

rm -rf data/output.dat

$SPARK_HOME/bin/spark-submit \
  --class com.contovista.WordCount \
  --master spark://localhost:37077 \
  --executor-memory 8G \
  libs/simple-test.jar \
  file:$(pwd)/data/words.dat file:$(pwd)/data/output.dat

cat data/output.dat/part-0000*
