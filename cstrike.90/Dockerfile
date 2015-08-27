FROM inanimate/steamcmd-play

ENV GAME_NAME cstrike
ENV GAME_ID 90
ENV GAME_PATH ${STEAMCMD_LOC}/${GAME_NAME}

RUN for i in {1..20}; do ${STEAMCMD} +login anonymous +force_install_dir ${GAME_PATH} +app_update ${GAME_ID} validate +quit; done

WORKDIR ${GAME_PATH}

ENTRYPOINT ["./hlds_run", "-game cstrike"]

