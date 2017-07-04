# On-demand spigot server
This is a docker image running Minecraft (spigot) on openjdk8-jre. 
When started it will download and build the lates version of Spigot.

After the build completes, the build files are deleted and the spigot server is started.

The start of this image can take quite some time, depending on the resources devoted to the container.
The entire server directory is exposed to enable a mount to the host system for persistence.
The idea is to let this container run continuously and only be occasionly restarted to update the .jar 

## Volumes
/minecraft/repository

## Ports
* 25565
* 25566
