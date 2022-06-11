#!/bin/bash
docker network create simple_network
terraform import docker_network.simple_network $(docker inspect -f {{.Id}} simple_network)
