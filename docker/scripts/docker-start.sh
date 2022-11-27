#!/bin/bash

set -e

CURRENT_DIR=`dirname ${BASH_SOURCE[0]}`
ROOT_DIR=$CURRENT_DIR/../..

python $ROOT_DIR/manage.py migrate
python $ROOT_DIR/manage.py runserver ${DJANGO_HOST}:${DJANGO_PORT}
