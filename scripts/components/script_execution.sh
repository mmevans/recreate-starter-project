#!/usr/bin/env bash

# Terminate on any failure and display commands.

set -ex

OUTPUT=1
COMMAND=${1}
waitForScriptToLoad(){
  while [[ ${OUTPUT} -ne 0 ]]
    do
      `${COMMAND}`
      OUTPUT=$(($?))
      echo "init_script finish with output: ${OUTPUT}"
      if [ "${OUTPUT}" -ne 0 ] ;then
        sleep 10
      fi

    done

  echo "script created via Daml Script emulation - ${COMMAND} "
}

waitForScriptToLoad
