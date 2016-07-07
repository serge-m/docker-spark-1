# Docker container for spark stand alone cluster

A network `spark_nw` will be created. Each node connects to this network. Only
the master node will be in interactive mode (started with `-i` flag).

For now the network creation and the creation of the worker nodes is done
manually, something that I plan to automate using Docker compose.

You might want to adjust the ports depending on your setup. The are currently prefixed with `3`:

```
# in start-master.sh
  -p 38080:8080 \
  -p 34040:4040 \
  -p 37077:7077 \
```

Internally the ports are the default ones.

# Building the Docker image

## 0. Pre

```
# Start docker daemon
sudo docker daemon
```

## 1. Build image

```
# Build this image
./build-image.sh
```

Note that the version depends on git and the current status. Commit your
changes before building, or leave it dirty on all times...

# How to start the cluster

```
# To setup a private docker network for the cluster
./create-network.sh

# Create master node (the name is important)
./start-master.sh

# Create n worker nodes (repeat this step n-times)
./start-worker.sh
```

# Testing

If you want to test your new cluster, you can use

```
./tests/pytest.sh
```

Make sure that you installed Spark locally as well, and that the `SPARK_HOME`
environment flag is set correctly.

You might want to adapt the path of the to-be committed jar file, depending on
your Spark environment (I build it myself).

## Testing disk IO

First prepare the necessary files with

    make simple-test
    make prepare-data

Then run the io test with

    ./test/iotest.sh

# Memory

By default, Spark uses all available cores and all the available memory. Just
like a docker image will do as well. So if you start two docker workers on a
host with 8 cores, each one of them will have 8 cores available. And if the
host has 64G memory, the workers will have both somethings in the similar
range. This can be changed in `conf/slave.conf` using the `-c` flag. The same
is valid for the memory, which can be set with the `-m` flag.

When submitting an application, the memory it takes per executor must be 
specified by `spark.executor.memory` in the configuration/application itself or 
by the `--executor-memory` flag.

# Disk IO

See discussion  
[https://www.mail-archive.com/user@spark.apache.org/msg28820.html](here).

# Credit

Thanks to:

- [https://www.anchormen.nl/spark-docker/](anchormen.nl)
- [https://github.com/epahomov/docker-spark](epahomov)
