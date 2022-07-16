#!/bin/bash

docker stop "$(docker ps -a -q)"
docker rm "$(docker ps -a -q)"

docker images -a |  awk '{print $3}' | xargs docker rmi
docker rmi "$(docker images -a -q)"

docker container prune -f
docker volume prune -f
docker network prune -f
docker image prune -f
