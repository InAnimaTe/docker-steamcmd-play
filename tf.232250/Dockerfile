FROM inanimate/steamcmd-play

ENV GAME_NAME tf
ENV GAME_ID 232250
ENV GAME_LAUNCHER srcds_run

ENV GAME_PATH ${STEAMCMD_LOC}/${GAME_NAME}

RUN ${STEAMCMD} +login anonymous +force_install_dir ${GAME_PATH} +app_update ${GAME_ID} validate +quit

WORKDIR ${GAME_PATH}

ENTRYPOINT ["./${GAME_LAUNCHER}", "-game ${GAME_NAME}"]

