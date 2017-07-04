#!/usr/bin/env bash

# this script updates spigot to the latest version and starts the server
# created by Jesper Bagge <jesperbagge.gmail.com>

# fix permissions recursively from /minecraft based on a temp reffile created at run-time
# there are shitloads of examples on how to do this on Github but I figured this one out
# by myself and it seems to be the simplest one... :)
touch reffile
chown -R --reference=reffile ..
rm reffile

# create build area, navigate and get latest BuildTools.jar
mkdir -p buildtools
cd buildtools
curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

# configure git
git config --global --unset core.autocrlf

# run buildtools
java -jar BuildTools.jar --rev ${VERSION:-latest}

# navigate back to executable folder
cd ${EXECUTABLES}

# move finished binary to executable directory
mv buildtools/spigot-*.jar ${EXECUTABLES}/spigot.jar

# clean up
rm -rf buildtools

# navigate to repository
cd ${REPOSITORY}

# Accept EULA
if [ ! -f eula.txt ] ; then
  echo "eula=true" > eula.txt
fi

# start server
java -Xms512M -Xmx4G -XX:+UseConcMarkSweepGC -jar ${EXECUTABLES}/spigot.jar
