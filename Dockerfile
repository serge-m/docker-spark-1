FROM ubuntu:16.04

MAINTAINER Samuel von Baussnern <samuel.vonbaussnern@gmail.com>

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes software-properties-common python-software-properties
RUN apt-get install -y openjdk-8-jdk openjdk-8-jre wget vim tmux less

WORKDIR /home/root/

RUN wget http://mirror.switch.ch/mirror/apache/dist/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz -O - | tar -xvz && ln -s spark-1.6.1-bin-hadoop2.6 spark

COPY scripts/ .

ENV SPARK_HOME /home/root/spark

ENV SPARK_MASTER_OPTS "-Dspark.driver.port=27001 -Dspark.fileserver.port=27002 -Dspark.broadcast.port=27003 -Dspark.replClassServer.port=27004 -Dspark.blockManager.port=27005 -Dspark.executor.port=27006 -Dspark.ui.port=24040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"
ENV SPARK_WORKER_OPTS "-Dspark.driver.port=27001 -Dspark.fileserver.port=27002 -Dspark.broadcast.port=27003 -Dspark.replClassServer.port=27004 -Dspark.blockManager.port=27005 -Dspark.executor.port=27006 -Dspark.ui.port=24040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"

ENV SPARK_MASTER_PORT 27077
ENV SPARK_MASTER_WEBUI_PORT 28080
ENV SPARK_WORKER_PORT 28888
ENV SPARK_WORKER_WEBUI_PORT 28081

EXPOSE 28080 27077 28888 28081 24040 27001 27002 27003 27004 27005 27006
