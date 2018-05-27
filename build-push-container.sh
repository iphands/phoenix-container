#!/bin/bash
set -e

PREFIX=docker.io/iphands
CONTAINER_NAME=phoenix-emu-unofficial
URL=${PREFIX}/${CONTAINER_NAME}

docker build -t $URL .
HASH=`docker run $URL /home/user/git-version-helper.sh`
docker tag $URL $URL:${HASH}
docker push $URL:${HASH}

