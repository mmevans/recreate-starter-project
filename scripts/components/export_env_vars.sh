#!/usr/bin/env bash

# Terminate on any failure and display commands.

set -ex


export SCRIPT_DIR=$(dirname $0) #main/scripts/
export SCRIPT_COMPONENTS_DIR=${SCRIPT_DIR}/components   #main/scripts/components/
export PROJECT_DIR=${SCRIPT_DIR}/..   #main/


# ENV Vars for process
export LEDGER_HOST=localhost
export LEDGER_PORT=6865
export NAVIGATOR_PORT=7500
export HTTP_PORT=7575

export MODELS_DAR=${PROJECT_DIR}/daml/.daml/dist/models-0.0.1.dar
export INIT_DAR=${PROJECT_DIR}/daml/.daml/dist/init-0.0.1.dar
export TEST_MODELS_DAR=${PROJECT_DIR}/daml/.daml/dist/test-0.0.1.dar

