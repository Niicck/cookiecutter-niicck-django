SHELL := /bin/bash
-include .env

.PHONY: install pre-commit type-check env-file build up shell

install:
	poetry

# Run pre-commit without commiting.
pre-commit:
	pre-commit

# Run mypy type checking.
# Not included in standard pre-commit because it takes a bit more time.
type-check:
	poetry run mypy niicck_django_cookiecutter

# Create .env from template if .env doesn't already exist
env-file:
	cp -n ./utils/template.env .env

build:
	sh ./utils/build_requirements_txt.sh
	docker compose \
		-f ./docker/docker-compose.yml \
		-f ./docker/docker-compose.local.yml \
		--env-file .env \
		build

up:
	docker compose \
		-f ./docker/docker-compose.yml \
		-f ./docker/docker-compose.local.yml \
		--env-file .env \
		up

troubleshoot:
	docker compose \
		-f ./docker/docker-compose.yml \
		-f ./docker/docker-compose.local.yml \
		-f ./docker/docker-compose.troubleshooting.yml \
		--env-file .env \
		up

shell:
	docker exec -it docker-app-1 /bin/bash

shell_plus:
	docker exec -it docker-app-1 python manage.py shell_plus

db-shell:
	docker exec -it docker-db-1 psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -w
