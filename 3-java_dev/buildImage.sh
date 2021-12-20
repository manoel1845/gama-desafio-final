#!/bin/bash

cd app-code
export DOCKER_USERNAME="manoel1845"
export DOCKER_PASSWORD="GamaDesafio123"
sudo docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"
echo "
FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/SpringWeb-1.0.0.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
" > Dockerfile
sudo docker build -t manoel1845/javaspring:0.0.1 -f Dockerfile .
sudo docker tag manoel1845/javaspring:0.0.1 hub.docker.com/r/manoel1845/javaspring:0.0.1
sudo docker push manoel1845/javaspring:0.0.1