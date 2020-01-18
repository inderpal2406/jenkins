#!/bin/bash

# script to build jar file using maven image and docker

echo "**********************************************"
echo "************** Testing JAR *******************"
echo "**********************************************"

docker run --name maven_test --rm -v $PWD/java_app:/app -v /root/.m2:/root/.m2 -w /app maven:3-alpine "$@"
