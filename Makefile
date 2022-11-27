.PHONY: install pre-commit type-check .env build up

include .env
export

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
.env:
	cp ./utils/template.env .env

build:
	sh ./utils/build_requirements_txt.sh
	docker compose \
		-f ./docker/docker-compose.yml \
		-f ./docker/docker-compose.local.yml \
		build

up:
	docker compose \
		-f ./docker/docker-compose.yml \
		-f ./docker/docker-compose.local.yml \
		--env-file .env \
		up
