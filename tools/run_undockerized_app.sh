#!/bin/bash
set -o nounset -o pipefail -o errexit
CURRENT_DIR=`dirname "${BASH_SOURCE[0]}"`
pushd "$CURRENT_DIR/.." > /dev/null

# Load all variables from .env and export them
# Overwrites POSTGRES_HOST=postgres to be POSTGRES_HOST=127.0.0.1
# in order to connect to postgres container from outside the docker network.
set -o allexport
source .env
POSTGRES_HOST="127.0.0.1"
set +o allexport

# Run App
poetry run \
    ./docker/images/django/scripts/entrypoint.sh \
    ./docker/images/django/scripts/start.sh
