#!/bin/sh

docker build -t docker.io/${DOCKER_USER}/maxcso:${LATEST_TAG} -f Dockerfile-tagged --build-arg tag=v${LATEST_TAG}
docker build -t docker.io/${DOCKER_USER}/maxcso:latest -f Dockerfile

docker push docker.io/${DOCKER_USER}/maxcso:latest
docker push docker.io/${DOCKER_USER}/maxcso:${LATEST_TAG}
