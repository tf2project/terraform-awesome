#!/bin/bash
docker run -d --name nginx_container nginx:latest
terraform import docker_container.nginx_container $(docker inspect -f {{.ID}} nginx_container)
sed -i "s|nginx:latest|$(docker inspect -f {{.Image}} nginx_container)|g" ./main.tf 
