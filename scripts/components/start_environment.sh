#!/usr/bin/env bash

# Terminate on any failure and display commands.

set -ex

# sub processes for local tests

${SCRIPT_COMPONENTS_DIR}/start_sandbox.sh
${SCRIPT_COMPONENTS_DIR}/start_navigator.sh
${SCRIPT_COMPONENTS_DIR}/start_json_api.sh
${SCRIPT_COMPONENTS_DIR}/upload_dars.sh

