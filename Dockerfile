FROM debian:jessie

ENV RUNUSER daemon
ENV DAEMON_HOME /home/${RUNUSER}
ENV STEAMCMD_LOC ${DAEMON_HOME}/steamcmd
ENV STEAMCMD ${STEAMCMD_LOC}/steamcmd.sh

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        lib32gcc1 \
        ca-certificates \
        lib32stdc++6 \
        lib32z1 \
        lib32z1-dev \
        curl && \
            apt-get clean

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
        chown -R ${RUNUSER}:${RUNUSER} ${DAEMON_HOME}

WORKDIR ${STEAMCMD_LOC}

USER ${RUNUSER}

ENTRYPOINT ["/home/daemon/steamcmd/steamcmd.sh"]
