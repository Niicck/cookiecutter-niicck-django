# niicck_django_cookiecutter

- [Installation](#installation)
- [Getting Started](#getting-started)
  - [Environment Variables](#environment-variables)
  - [Run the app with Docker](#run-the-app-with-docker)

## Installation

This project is designed to use pyenv (on python v3.11), poetry, and docker for development. If you are missing any of these system dependencies, you can get installation instructions from these links:

- [Pyenv](https://github.com/pyenv/pyenv#installation)
- [Poetry](https://python-poetry.org/docs/)
- [Docker](https://docs.docker.com/get-docker/)

Install your dev dependencies by running:
- `poetry`

This will install the pre-commit hooks and other tools that are necessary for development.

## Getting Started

### Environment Variables
1. Run `make env-file` to build a .env file from a template.
2. Configure any variables as needed, change any variables that say `changeme`.

### Run the app with Docker
1. Run `make build` to build your app docker container.
   - Re-run this command whenever your poetry dependencies change.
2. Run `make up` to start up the docker containers for this project.
