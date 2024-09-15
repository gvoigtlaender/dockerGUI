# We are going to use the Latest version of Debian (Stable)
FROM  debian:latest

# need to setup user & group, since we want to run GUI app in host user context
ARG UNAME
ARG UID
ARG GID

RUN groupadd -g $GID $UNAME
RUN useradd -u $UID -g $GID -m $UNAME

# update installation and install some requirements
RUN apt update
RUN apt install -y fuse libfuse2 libgl1 libegl1 locales fontconfig wget xdg-utils epiphany thunar

# update locales
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen &&  locale-gen
ENV LANG=en_US.UTF-8  
ENV LANGUAGE=en_US:en  
ENV LC_ALL=en_US.UTF-8 
 
# RUN apt install -y libcanberra-gtk-module libcanberra-gtk3-module libcanberra-gtk3-0
ENV GDK_SYNCHRONIZE=1
ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/gtk-2.0/modules

WORKDIR /opt

# CMD GDK_SYNCHRONIZE=1 /opt/UltiMaker-Cura-5.8.0-linux-X64.AppImage -platformtheme gtk3 
