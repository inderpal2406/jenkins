#!/bin/bash

# initialise vars

echo "***** Initialising Variables in Jenkins machine *****"
echo "maven-project" > /tmp/.auth
echo "$BUILD_TAG" >> /tmp/.auth
echo "$PASS" >> /tmp/.auth
echo "******** Variables initiated successfully ***********"
echo 

# copy var file and deployment script to remote machine

echo "********** Copying files to remote machine **********"
scp -i ./ssh_keys/prod-user-key /tmp/.auth prod-user@18.138.248.253:/tmp/
scp -i ./ssh_keys/prod-user-key ./jenkins/deploy/publish.sh prod-user@18.138.248.253:/tmp/
echo

# ssh to remote machine and execute deployment script
echo "***** SSH to remote machine and execute deployment script to make the deployment *****"
ssh -i ./ssh_keys/prod-user-key prod-user@18.138.248.253 "chmod +x /tmp/publish.sh; /tmp/publish.sh"

