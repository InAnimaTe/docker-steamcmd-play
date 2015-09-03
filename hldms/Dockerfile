FROM inanimate/steamcmd-play

ENV GAME_NAME hl1mp
ENV GAME_ID 255470

ENV GAME_PATH ${STEAMCMD_LOC}/${GAME_NAME}

RUN ${STEAMCMD} +login anonymous +force_install_dir ${GAME_PATH} +app_update ${GAME_ID} validate +quit

WORKDIR ${GAME_PATH}

ENTRYPOINT ["./srcds_run", "-game hl1mp"]

CMD ["+sv_lan", "1", "+map", "crossfire"]
