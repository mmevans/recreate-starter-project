#!/usr/bin/env bash

# Terminate on any failure and display commands.

set -ex

CANTON_PORT_FILE=${SCRIPT_COMPONENTS_DIR}/canton-sandbox-port.txt
rm -f ${CANTON_PORT_FILE}

daml sandbox \
  --port-file ${CANTON_PORT_FILE} \
  --log-level-root=INFO \
  --log-level-canton=INFO \
  --log-level-stdout=DEBUG >> ${SCRIPT_COMPONENTS_DIR}/sandbox.log 2>&1 &

# For waitForSandBox see https://discuss.daml.com/t/can-i-specify-several-dars-to-be-uploaded-when-using-the-daml-start-command/4770/4

waitForSandBox(){
  timeout=100
  while [ ! -f "${CANTON_PORT_FILE}" ];
    do
      echo "Setting up sandbox..."
      if [ "${timeout}]" == 0 ]; then
        echo "ERROR: Timeout while waiting for the file ${CANTON_PORT_FILE}"
        exit 1
      sleep 2 
      fi
      sleep 1
      ((timeout--))
    done
  echo "Canton sandBox setup complete"
}

waitForSandBox
