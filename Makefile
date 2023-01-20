SHELL := /bin/bash
-include .env

install:
	poetry

# Run pre-commit without commiting.
pre-commit:
	pre-commit

# Run mypy type checking.
# Not included in standard pre-commit because it takes a bit more time.
type-check:
	poetry run mypy cookiecutter_niicck_django

# Create .env from template if .env doesn't already exist
env-file:
	cp -n ./tools/.env-sample .env

# Build "build/requirements/dev.txt"
requirements-dev:
	python ./tools/build_requirements.py --dev

# Build your django app docker container
build: requirements-dev
	docker compose \
		-f ./docker/compose/docker-compose.yml \
		-f ./docker/compose/docker-compose.local.yml \
		--env-file .env \
		build

# Run your django app docker container
up:
	docker compose \
		-f ./docker/compose/docker-compose.yml \
		-f ./docker/compose/docker-compose.local.yml \
		--env-file .env \
		up

# Kill and restart your django app docker container
restart:
	docker compose \
		-f ./docker/compose/docker-compose.yml \
		-f ./docker/compose/docker-compose.local.yml \
		--env-file .env \
		kill app
	docker compose \
		-f ./docker/compose/docker-compose.yml \
		-f ./docker/compose/docker-compose.local.yml \
		--env-file .env \
		restart app

# Run a django app docker container without runserver
troubleshoot:
	docker compose \
		-f ./docker/compose/docker-compose.yml \
		-f ./docker/compose/docker-compose.local.yml \
		-f ./docker/compose/docker-compose.troubleshooting.yml \
		--env-file .env \
		up

# Enter into a bash shell inside your running django app docker container
shell:
	docker exec -it ${COMPOSE_PROJECT_NAME}-app-1 /bin/bash

# Enter into the django python shell inside your running django app docker container
shell-plus:
	docker exec -it ${COMPOSE_PROJECT_NAME}-app-1 python manage.py shell_plus

# Enter into the postgres db shell inside your running postgres container
db-shell:
	docker exec -it ${COMPOSE_PROJECT_NAME}-db-1 psql -U ${POSTGRES_USER} -p ${POSTGRES_PORT}  -d ${POSTGRES_DB} -w

# Create a superuser for your django app
superuser:
	docker exec -it ${COMPOSE_PROJECT_NAME}-app-1 python manage.py createsuperuser

# Run django app undockerized, but dockerize all other services
up-no-app:
	docker compose \
		-f ./docker/compose/docker-compose.yml \
		--env-file .env \
		up \
		db node

# Run django app undockerized
up-undockerized-app:
	./tools/activate.sh \
		./tools/run_undockerized_app.sh
