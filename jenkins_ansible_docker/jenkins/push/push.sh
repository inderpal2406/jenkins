#!/bin/bash

echo "*****************************************"
echo "************ Pushing Image **************"
echo "*****************************************"
echo
echo "***** Logging In to Docker Registry *****"
docker login -u inderpal2406 -p $DOCKERHUB_PASSWORD
echo
echo "*********** Pushing Image ***************"
docker push inderpal2406/maven-project:$BUILD_TAG
