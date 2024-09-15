# dockerGUI
Allows to run a GUI application in docker container

## UltiMaker-Cura
The scripts are prepared to start *UltiMaker-Cura*, the AppImage is to be placed in the root directory. The containerized instance has access to the current USERs host HOME 

Feel free to adjust

# Warning
## The container has access to the users home directory of host! 
Tools might write to host profiles!
It uses thunar file manager and epiphany browser - change if you need!

### Open Issues
* Warning 'Failed to load module "canberra-gtk-module" '. Installing libcanberra-packages did not help. See *Dockerfile*
* GVFS-WARNING 'The peer-to-peer connection failed: Error when getting information for file “/home/$USER/.cache/gvfsd”'. Not followed up so far
