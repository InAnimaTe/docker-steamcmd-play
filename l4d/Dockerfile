FROM inanimate/steamcmd-play

ENV GAME_NAME left4dead
ENV GAME_ID 222840

ENV GAME_PATH ${STEAMCMD_LOC}/${GAME_NAME}

RUN ${STEAMCMD} +login anonymous +force_install_dir ${GAME_PATH} +app_update ${GAME_ID} validate +quit

WORKDIR ${GAME_PATH}

ENTRYPOINT ["./srcds_run", "-game left4dead"]

CMD ["+sv_lan", "1", "+map", "l4d_hospital01_apartment"]
