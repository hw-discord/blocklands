#!/bin/bash
java -Dcom.mojang.eula.agree=true -Xms1G -Xmx1G -XX:+UseG1GC\
 -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC\
 -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80\
 -XX:G1MixedGCLiveThresholdPercent=35 -XX:+AlwaysPreTouch\
 -XX:+ParallelRefProcEnabled -Dusing.aikars.flags=mcflags.emc.gs -jar paper.jar
