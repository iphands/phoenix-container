#!/bin/bash
xhost +local:root
nvidia-docker run \
              --privileged \
              -ti \
              --rm \
              -e DISPLAY \
              -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
              -v $PWD/roms:/roms:ro \
              -v $PWD/cores:/home/user/phoenix-build/Cores:ro \
              -v $PWD/userdata:'/home/user/phoenix-build/User Data':rw \
              phoenix
