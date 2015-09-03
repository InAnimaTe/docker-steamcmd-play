FROM inanimate/steamcmd-play

ENV GAME_NAME cstrike
ENV GAME_ID 232330

ENV GAME_PATH ${STEAMCMD_LOC}/${GAME_NAME}

RUN ${STEAMCMD} +login anonymous +force_install_dir ${GAME_PATH} +app_update ${GAME_ID} validate +quit

WORKDIR ${GAME_PATH}

ENTRYPOINT ["./srcds_run", "-game cstrike"]

CMD ["+sv_lan", "1", "+map", "de_dust2"]
