#!/bin/bash

# script to test using maven image and docker

echo "**********************************************"
echo "*************** Testing **********************"
echo "**********************************************"

docker run --name maven_test --rm -v $PWD/java_app:/app -v /root/.m2:/root/.m2 -w /app maven:3-alpine "$@"
