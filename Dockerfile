FROM ubuntu:16.04

MAINTAINER Samuel von Baussnern <samuel.vonbaussnern@gmail.com>

RUN apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes software-properties-common python-software-properties
RUN apt-get install -y \
  openjdk-8-jdk \
  openjdk-8-jre \
  wget \
  vim \
  tmux \
  less \
  iputils-ping \
  supervisor \
  acl

WORKDIR /opt/

RUN wget http://mirror.switch.ch/mirror/apache/dist/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz -O - \
  | tar -xvz -C /opt/ && \
  ln -s /opt/spark-1.6.1-bin-hadoop2.6 /opt/spark

#COPY scripts/ /opt/
COPY conf/ /opt/conf/

ENV SPARK_HOME /opt/spark

ENV SPARK_MASTER_OPTS "-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"
ENV SPARK_WORKER_OPTS "-Dspark.driver.port=7001 -Dspark.fileserver.port=7002 -Dspark.broadcast.port=7003 -Dspark.replClassServer.port=7004 -Dspark.blockManager.port=7005 -Dspark.executor.port=7006 -Dspark.ui.port=4040 -Dspark.broadcast.factory=org.apache.spark.broadcast.HttpBroadcastFactory"

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_WORKER_PORT 8888
ENV SPARK_WORKER_WEBUI_PORT 8081

EXPOSE 8080 7077 8888 8081 4040 7001 7002 7003 7004 7005 7006

RUN groupadd -r contovista -g 1999 && useradd -r -g contovista sparkuser
RUN mkdir /data && \
    chgrp contovista /data && \
    chmod g+s /data && \
    setfacl -d -m g::rwx /data && \
    chown -R sparkuser:contovista /opt/spark && \
    chown -R sparkuser:contovista /opt/spark-1.6.1-bin-hadoop2.6 && \
    mkdir -p /home/sparkuser && \
    chown sparkuser:contovista /home/sparkuser

WORKDIR /home/sparkuser/
USER sparkuser
