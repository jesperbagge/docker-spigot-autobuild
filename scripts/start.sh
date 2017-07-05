#!/usr/bin/env bash

# this script should only be used to restart the server

# navigate to repository
cd ${REPOSITORY}

# start server
java -Xms512M -Xmx4G -XX:+UseConcMarkSweepGC -jar ${EXECUTABLES}/spigot.jar
