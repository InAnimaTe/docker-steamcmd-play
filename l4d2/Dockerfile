FROM inanimate/steamcmd-play

ENV GAME_NAME left4dead2
ENV GAME_ID 222860

ENV GAME_PATH ${STEAMCMD_LOC}/${GAME_NAME}

RUN ${STEAMCMD} +login anonymous +force_install_dir ${GAME_PATH} +app_update ${GAME_ID} validate +quit

WORKDIR ${GAME_PATH}

ENTRYPOINT ["./srcds_run", "-game left4dead2"]

CMD ["+sv_lan", "1", "+map", "c2m1_highway"]
