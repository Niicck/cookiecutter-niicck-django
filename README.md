# niicck_django_cookiecutter

- [Installation](#installation)
- [Getting Started](#getting-started)
  - [Environment Variables](#environment-variables)
    - [Adding a new environment variable](#adding-a-new-environment-variable)
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

#### Adding a new environment variable
You'll have to add it in 4 different places for it to pass through to your app.
1. First add it to the template: [./utils/.env-sample](./utils/.env-sample)
2. Then add it to your actual [./.env](./.env)
3. Add it to the "app ENV vars" list within [./docker/django.Dockerfile](./docker/django.Dockerfile) and rebuild your container with `make build`.
4. Add it the `app.environment:` list within [./docker/docker-compose.yml](./docker/docker-compose.yml).
5. Add it to your hosting service secrets. TBD

### Run the app with Docker
1. Run `make build` to build your app docker container.
   - Re-run this command whenever your poetry dependencies change.
2. Run `make up` to start up the docker containers for this project.
