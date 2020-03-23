# vim:fileencoding=utf-8:foldmethod=marker:softtabstop=2:shiftwidth=2
#
# hello_world
FROM openjdk:8

ARG DIR_SERVER=/opt/minecraft
ARG DIR_DATA=/opt/data

# paper kullanıcısını, data ve server klasörlerini oluştur
RUN useradd -MUs /bin/bash -u 1000 paper\
  && mkdir $DIR_SERVER $DIR_DATA/plugins $DIR_DATA/config -p\
  && chown paper:paper $DIR_SERVER $DIR_DATA -R
USER paper

# başlangıç scriptini kopyala
COPY --chown=paper:paper ./start.sh $DIR_SERVER
RUN chmod +x $DIR_SERVER/start.sh

# paperspigot'ı indir
ADD --chown=paper:paper https://papermc.io/api/v1/paper/1.15.2/latest/download\
  $DIR_SERVER/paper.jar

# server klasöründen data klasörüne linklemeleri yap
RUN cd $DIR_DATA/config\
  && ln -s bukkit.yml commands.yml help.yml paper.yml permissions.yml server.properties\
           spigot.yml wepif.yml $DIR_SERVER\
  && cd $DIR_DATA/plugins
  && ln -s bStats $DIR_SERVER/plugins/bStats\
  && ln -s Essentials/motd.txt Essentials/custom_items.yml Essentials/upgrades-done.yml\
           Essentials/kits.yml Essentials/worth.yml Essentials/config.yml\
           Essentials/warps Essentials/items.json $DIR_SERVER/plugins/Essentials

VOLUME $DIR_SERVER
VOLUME $DIR_DATA

EXPOSE 25565

WORKDIR $DIR_SERVER
ENTRYPOINT ["bash", "-c", "./start.sh"]
