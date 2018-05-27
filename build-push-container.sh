#!/bin/bash
set -e

docker build -t docker.io/iphands/phoenix .
HASH=`docker run docker.io/iphands/phoenix /home/user/git-version-helper.sh`
docker tag docker.io/iphands/phoenix docker.io/iphands/phoenix:${HASH}
docker push docker.io/iphands/phoenix:${HASH}

