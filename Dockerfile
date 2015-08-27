FROM debian:jessie

ENV DAEMON_HOME /home/daemon
ENV STEAMCMD_LOC ${DAEMON_HOME}/steamcmd

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        lib32gcc1 \
        ca-certificates \
        lib32stdc++6 \
        lib32z1 \
        lib32z1-dev \
        curl

RUN rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/locale/* \
        /var/cache/debconf/*-old \
        /var/lib/apt/lists/* \
        /usr/share/doc/*

RUN mkdir -p ${STEAMCMD_LOC}  && \
        curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -v -C ${STEAMCMD_LOC} -zx && \
        chown -R daemon:daemon ${DAEMON_HOME}

WORKDIR ${STEAMCMD_LOC}


