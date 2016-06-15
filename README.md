Docker container for spark stand alone cluster
=================================

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

# Create n worker nodes
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
