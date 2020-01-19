#!/bin/bash

# initializing vars by reading /tmp/.auth file.

echo "**** Initialising Variables on remote machine ****"
export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export PASS=$(sed -n '3p' /tmp/.auth)
echo "******** Variables initiated successfully ********"
echo

# logging in to docker hub

echo "************ Logging in to Docker Hub ************"
docker login -u inderpal2406 -p $PASS
echo

# bringing up java app service on remote machine using docker-compose 
echo "***** Bringing up java app service on remote machine *****"
cd ~/maven && docker-compose up -d
echo
if [ $? -eq 0 ]
then
	GREEN='\033[0,32m'
	NC='\033[0m'
	echo -e "${GREEN}*************** Successfull deployment ******************${NC}"
else
	RED='\033[0;31m'
	NC='\033[0m'
	echo "${RED}************* Unsuccessfull deployment ******************${NC}"
fi
