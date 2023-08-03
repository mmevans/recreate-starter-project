#!/usr/bin/env bash

# Terminate on any failure and display commands.

set -ex

daml navigator server --port ${NAVIGATOR_PORT} \
  --feature-user-management=false >> ${SCRIPT_COMPONENTS_DIR}/navigator.log 2>&1 &
sleep 1
