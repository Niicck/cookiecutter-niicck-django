#!/bin/bash
set -o nounset -o pipefail -o errexit
CURRENT_DIR=`dirname "${BASH_SOURCE[0]}"`
pushd "$CURRENT_DIR/.." > /dev/null

# Run App
./docker/images/django/scripts/entrypoint.sh \
    ./docker/images/django/scripts/start.sh
