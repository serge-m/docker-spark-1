FROM ubuntu:16.04

MAINTAINER Samuel von Baussnern <samuel.vonbaussnern@gmail.com>

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes software-properties-common python-software-properties
RUN apt-get install -y openjdk-8-jdk openjdk-8-jre wget vim tmux less

WORKDIR /home/root/

RUN wget http://mirror.switch.ch/mirror/apache/dist/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz -O - | tar -xvz && ln -s spark-1.6.1-bin-hadoop2.6 spark

COPY scripts/ .

ENV SPARK_HOME /home/root/spark

ENV SPARK_MASTER_OPTS "-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"
ENV SPARK_WORKER_OPTS "-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_WORKER_PORT 8888
ENV SPARK_WORKER_WEBUI_PORT 8081

EXPOSE 8080 7077 8888 8081 4040 7001 7002 7003 7004 7005 7006
