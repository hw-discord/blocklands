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
RUN ln -s $DIR_DATA/plugins $DIR_SERVER/plugins\
    && ln -s $DIR_DATA/config/bukkit.yml $DIR_SERVER/bukkit.yml\
    && ln -s $DIR_DATA/config/commands.yml $DIR_SERVER/commands.yml\
    && ln -s $DIR_DATA/config/help.yml $DIR_SERVER/help.yml\
    && ln -s $DIR_DATA/config/paper.yml $DIR_SERVER/paper.yml\
    && ln -s $DIR_DATA/config/permissions.yml $DIR_SERVER/permissions.yml\
    && ln -s $DIR_DATA/config/server.properties $DIR_SERVER/server.properties\
    && ln -s $DIR_DATA/config/spigot.yml $DIR_SERVER/spigot.yml\
    && ln -s $DIR_DATA/config/spigot.yml $DIR_SERVER/wepif.yml

VOLUME $DIR_SERVER
VOLUME $DIR_DATA

EXPOSE 25565

WORKDIR $DIR_SERVER
ENTRYPOINT ["bash", "-c", "./start.sh"]
