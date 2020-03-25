# vim:fileencoding=utf-8:foldmethod=marker:softtabstop=2:shiftwidth=2
#
# hello_world
FROM openjdk:8

ARG DIR_SERVER=/opt/minecraft
ARG DIR_DATA=/opt/data
ENV DIR_SERVER=$DIR_SERVER DIR_DATA=$DIR_DATA

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

VOLUME $DIR_SERVER
VOLUME $DIR_DATA

EXPOSE 25565

WORKDIR $DIR_SERVER
ENTRYPOINT ["bash", "-c", "./start.sh"]
