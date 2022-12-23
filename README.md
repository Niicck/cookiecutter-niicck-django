# cookiecutter_niicck_django

- [About](#about)
- [Installation](#installation)
- [Getting Started](#getting-started)
  - [Initialize Environment Variables](#initialize-environment-variables)
  - [Run the app with Docker](#run-the-app-with-docker)
  - [Create Superuser](#create-superuser)
- [Development](#development)
    - [Adding a new environment variable](#adding-a-new-environment-variable)
- [Troubleshooting](#troubleshooting)

## About

This is a cookiecutter django app.

## Installation

This project is designed to use pyenv (on python v3.11), poetry, and docker for development. If you are missing any of these system dependencies, you can get installation instructions from these links:

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


## Development

#### Adding a new environment variable
You'll have to add it in 4 different places for it to pass through to your app.
1. First add it to the template: [./tools/.env-sample](./tools/.env-sample)
2. Then add it to your actual [./.env](./.env)
3. Add it to the "app ENV vars" list within [./docker/django.Dockerfile](./docker/django.Dockerfile) and rebuild your container with `make build`.
4. Add it the `app.environment:` list within [./docker/docker-compose.yml](./docker/docker-compose.yml).
5. Add it to your hosting service secrets. TBD

## Troubleshooting

We have a couple of Makefile commands that can help with troubleshooting.

- `make shell_plus` lets you shell into a running django app container if you want to manually run any Python code within your django app or investigate your data.
- `make db-shell` will let you read the raw data within your postgres database. I don't recommend writing, updating, or deleting any data outside of the django `make shell_plus` console unless you know what you're doing.
- `make troubleshoot` will start a django app docker container without starting the django app server. There may be some cases where you need to troubleshoot the construction of the Docker container itself and not a bug within your Python code. This option can allow you to `make shell` into a container to investigate what may be going wrong with your system.
