#!/bin/bash
xhost +
sudo docker run -t -i --privileged --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  --name=dcs_pro dostrowski995/dcs_projekt
