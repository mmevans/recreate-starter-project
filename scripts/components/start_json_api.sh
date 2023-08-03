#!/usr/bin/env bash

# Terminate on any failure and display commands.

set -ex

daml json-api --ledger-host ${LEDGER_HOST} \
  --ledger-port ${LEDGER_PORT} --http-port ${HTTP_PORT} \
  --max-inbound-message-size 9283730 >> ${SCRIPT_COMPONENTS_DIR}/json-api.log 2>&1 &
sleep 2
