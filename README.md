# Docker container for spark stand alone cluster

A network `spark_nw` will be created. Each node connects to this network. Only
the master node will be in interactive mode (started with `-i` flag).

For now the network creation and the creation of the worker nodes is done
manually, something that I plan to automate using Docker compose.

You might want to adjust the ports depending on your setup.

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

It connects to the default docker IP.

# Credit

Thanks to:

- [https://www.anchormen.nl/spark-docker/](anchormen.nl)
- [https://github.com/epahomov/docker-spark](epahomov)
