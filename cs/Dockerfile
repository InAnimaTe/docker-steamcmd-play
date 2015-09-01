FROM inanimate/steamcmd-play

ENV GAME_NAME cstrike
ENV GAME_ID 90
ENV GAME_PATH ${STEAMCMD_LOC}/${GAME_NAME}

RUN while :;\
    do ${STEAMCMD} +login anonymous +force_install_dir ${GAME_PATH} +app_update ${GAME_ID} validate +quit | tee /tmp/steamcmd.log;\
      if [ "$(cat /tmp/steamcmd.log | tail -n 9 | sha1sum | cut -d\  -f1)" = "e7840d7e1cecd6b41ce62b91670f3e9e2d187a3c" ];\
        then break;\
      fi;\
    done;\
    rm /tmp/steamcmd.log

WORKDIR ${GAME_PATH}

ENTRYPOINT ["./hlds_run", "-game cstrike"]

