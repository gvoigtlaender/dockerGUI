#!/bin/sh
USER=$(whoami)
UID=$(id -u)
GID=$(id -g)
docker build --build-arg UNAME=$USER --build-arg UID=$UID --build-arg GID=$GID -t gui-container .
