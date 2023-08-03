#!/usr/bin/env bash

# Terminate on any failure and display commands.
set -ex
trap "kill 0" EXIT

# Local start - Common initialization
D=$(dirname $0)
${D}/components/export_env_vars.sh ; . ${D}/components/export_env_vars.sh
${SCRIPT_COMPONENTS_DIR}/start_environment.sh


# The bussiness logic to be execute
INIT_SCRIPT="daml script \
  --ledger-host ${LEDGER_HOST} \
  --ledger-port ${LEDGER_PORT} \
  --dar ${INIT_DAR} \
  --script-name User:setup \
  --output-file ${SCRIPT_COMPONENTS_DIR}/init_result.json"


# The bussiness logic to be execute
${SCRIPT_COMPONENTS_DIR}/script_execution.sh "${INIT_SCRIPT}"


# idle waiting for abort from user
read -r -d '' _ </dev/tty