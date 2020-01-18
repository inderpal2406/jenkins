#!/bin/bash

# copy new jar file to build context directory

cp -f java_app/target/*.jar jenkins/build/

# building java app docker image using docker compose 

echo "****************************************"
echo "********* Building docker image ********"
echo "****************************************"
cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache
