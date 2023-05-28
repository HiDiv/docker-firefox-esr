#!/bin/sh
docker run -it --rm --name firefox-esr -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY --ipc=host hidiv/firefox-esr
