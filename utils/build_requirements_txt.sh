#!/bin/bash

# Export poetry requirements to requirements.txt.
# Docker containers will install packages via requirements.txt, not poetry.

CURRENT_DIR=`dirname ${BASH_SOURCE[0]}`
REQUIREMENTS_FILE=${CURRENT_DIR}/../docker/artifacts/requirements.txt

poetry export -f requirements.txt -o ${REQUIREMENTS_FILE} --with dev
