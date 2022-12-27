# Docker

- [Services](#services)
- [Compose files](#compose-files)
- [How we handle python dependencies](#how-we-handle-python-dependencies)

## Services

- app: this runs our django server.
- db: this runs our postgres database which powers our django app.
- node: this runs our static asset compilation that requires the use of node.js. (For example, compiling tailwindcss output.)

## Compose files

- `docker-compose.yml` contains the basic composition instructions for an "app" and a "db" service.
    - This is run with `make up` (which includes instructions from `docker-compose.local.yml`).
- `docker-compose.local.yml` contains a couple of add-ons to aid local development. It adds dynamic static asset compilation with the "node" service. And it mounts a volume to your live code, so that your "app" and "node" services can instantly update whenever you edit your code.
    - This is run with `make up`.
- `docker-compose.troubleshoot.yml` runs empty processes. This allow you the opportunity to shell into the containers and manually inspect them if something goes wrong with the build process.
  - This is run with `make troubleshoot`.

## How we handle python dependencies

When we run `make build` to build our local docker containers, we also run a command `make requirements-dev`.

This command exports our poetry python requirements into a "requirements.txt" formatted file in our `build/` directory. This allows us to to simply `pip install` that file to install our python requirements within docker without requiring the use of poetry.

This is a not-uncommon workflow. We use poetry for the convenience of local development, but when it comes time for deployment, we install dependencies using a basic requirements.txt file.

This workflow is beneficial because:
- It eliminates the need to install poetry on our docker container, making our containers smaller and simpler.
- It eliminates the need to then run poetry virtual environments within our docker container, which is a little redundant.
  - Alternatively, one could install poetry dependencies system-wide, however this has a few known bugs: https://github.com/python-poetry/poetry/pull/3209#issuecomment-710678083

For information on other alternatives to managing python dependencies within docker, see this comment: https://github.com/python-poetry/poetry/discussions/1879#discussioncomment-346113
