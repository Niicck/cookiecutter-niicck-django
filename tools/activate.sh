#!/bin/bash

source $(poetry env info --path)/bin/activate

# Source all variables from .env and export them
set -o allexport
source .env
set +o allexport

$@
