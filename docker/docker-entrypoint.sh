#!/bin/sh

set -e

# Activate our poetry virtual environment.
. ${VENV_PATH}/bin/activate

# Wait for postgres db to become available
python ./wait_for_db.py
>&2 echo 'PostgreSQL is available'

# Evaluate passed CMD
exec "$@"
