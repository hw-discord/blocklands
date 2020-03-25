#!/bin/bash

# sunucu config'lerini linkle
cd $DIR_DATA/config
find . -type f -exec ln -sf $PWD/{} $DIR_SERVER/{} \;

# plugin jar ve config'lerini linkle
cd $DIR_DATA/plugins
find . -type f -exec bash -c 'mkdir $DIR_SERVER/plugins/$(dirname {}) -p &&\
  ln -sf $PWD/{} $DIR_SERVER/plugins/{}' \;

# sunucuyu başlat
cd $DIR_SERVER
java -Dcom.mojang.eula.agree=true -Xms1G -Xmx1G -XX:+UseG1GC\
 -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC\
 -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80\
 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch\
 -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs -jar paper.jar
