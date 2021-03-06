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

# Credit

Thanks to:

- [https://www.anchormen.nl/spark-docker/](anchormen.nl)
- [https://github.com/epahomov/docker-spark](epahomov)
