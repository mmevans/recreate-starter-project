#!/usr/bin/env bash

# Terminate on any failure and display commands.
set -ex

daml ledger upload-dar --host ${LEDGER_HOST} --port ${LEDGER_PORT} ${MODELS_DAR}
daml ledger upload-dar --host ${LEDGER_HOST} --port ${LEDGER_PORT} ${INIT_DAR}

sleep 5
