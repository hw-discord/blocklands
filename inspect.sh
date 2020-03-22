#!/bin/bash
dir="/proc/$(docker inspect --format {{.State.Pid}} paper)/root/opt"
if ! docker container inspect paper &>/dev/null; then
    printf "öncelikle konteynırı çalıştırmalısın.\n\n"
else
    echo $dir
    cd $dir
fi
