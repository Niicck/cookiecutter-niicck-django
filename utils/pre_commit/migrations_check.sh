#!/bin/bash

# Check that there aren't any unapplied model migrations.

CURRENT_DIR=`dirname ${BASH_SOURCE[0]}`
export DJANGO_CONFIGURATION=Test

poetry run python $CURRENT_DIR/../../manage.py makemigrations --check --dry-run
