#!/bin/bash

cd app-code
export DOCKER_USERNAME="manoel1845"
export DOCKER_PASSWORD="GamaDesafio123"
docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"
docker build -t manoel1845/javaSpring:0.0.1 -f Dockerfile .
#docker tag manoel1845/javaspring:0.0.1 hub.docker.com/r/celo/projeto_final
docker push manoel1845/javaSpring:0.0.1