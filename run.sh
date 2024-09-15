#!/bin/sh
USER=$(whoami)
UID=$(id -u)
GID=$(id -g)
APP=$(ls UltiMaker-Cura*.AppImage)
chmod +x $APP
xhost +local:
docker run \
	-v $(pwd):/opt \
	--rm -it \
	--user $UID:$GID \
	-v /home/$USER:/home/$USER \
	-e USER=$USER -e DISPLAY=:0 \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /dev/fuse:/dev/fuse \
	--mount type=bind,source=/run/user/$UID/at-spi/bus,target=/run/user/$UID/at-spi/bus \
	--mount type=bind,source=/run/user/$UID/bus,target=/run/user/$UID/bus \
	-e DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$UID/bus \
	--privileged \
	--network host \
	--name dockerGUI \
	gui-container /opt/$APP -platformtheme gtk3
xhost -

