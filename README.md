# On-demand spigot server
This is a docker image running Minecraft (Spigot) on openjdk:8. 
When started it will download and build the latest version of Spigot.

After the build completes, the build files are deleted and the Minecraft server is started.

The start of this image can take quite some time, depending on the resources devoted to the container.
The entire server directory is exposed to enable a mount to the host system for persistence.
The idea is to let this container run continuously and only be occasionly restarted to update the .jar 

There is an included start.sh script that can be set as the script to run when calling restart from the server prompt. You'll ave to configure this manually in the server config files.

This image is mainly created to run on a QNAP TS-251+ but will for sure run on other platforms.

Fire it up with this command for a server mounted to your present directory.
``` 
docker run -it -v "$PWD":/minecraft/repository -p 25565:25565 ramdad/spigot-autobuild
```

## Volumes
/minecraft/repository

## Ports
* 25565 - default server port
* 25566 - extra port for RCON
* 8123 - default port for DynMap
