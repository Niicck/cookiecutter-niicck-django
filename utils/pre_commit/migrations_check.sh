#!/bin/bash

# Check that there aren't any unapplied model migrations.

CURRENT_DIR=`dirname ${BASH_SOURCE[0]}`

# Source ENV_FILE if it exists
ENV_FILE=$CURRENT_DIR/../../.env
[ -e "$ENV_FILE" ] && . "$ENV_FILE"

export DJANGO_CONFIGURATION=Test
# Connect to POSTGRES_HOST=localhost when accessing postgres from outside of docker
# Connect to POSTGRES_HOST=postgres, when accessing postgres from within docker
export POSTGRES_HOST=localhost

poetry run python $CURRENT_DIR/../../manage.py makemigrations --check --dry-run
