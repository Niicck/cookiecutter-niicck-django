# cookiecutter_niicck_django

- [About](#about)
- [Installation](#installation)
- [Getting Started](#getting-started)
  - [Initialize Environment Variables](#initialize-environment-variables)
  - [Run the app with Docker](#run-the-app-with-docker)
  - [Create Superuser](#create-superuser)

## About

This is a django app.

## Installation

This project is designed to use pyenv (on python v3.11), poetry, node (v19.3.0), and docker for development. If you are missing any of these system dependencies, you can get installation instructions from these links:

- [Pyenv](https://github.com/pyenv/pyenv#installation)
- [Poetry](https://python-poetry.org/docs/)
- [Docker](https://docs.docker.com/get-docker/)
- [nvm](https://nodejs.org/en/download/package-manager/#nvm)

Set the correct version of pyenv by running:
- `pyenv install 3.11`
- `pyenv local 3.11`

Install the pre-commit hooks and other dependencies that are necessary for development:
- `poetry`

Set the correct version of node by running:
- `nvm install 19.3.0`
- `nvm use 19.3.0`

## Getting Started

### Initialize Environment Variables
1. Run `make env-file` to build a .env file from a template.
2. Configure any variables as needed, change any variables that say `changeme`.

### Run the app with Docker
1. Run `make build` to build your app docker container.
   - Re-run this command whenever your poetry dependencies change.
2. Run `make up` to start up the docker containers for this project.

### Create Superuser
1. Once your app is running with `make up` you can then create a superuser admin with `make superuser`
