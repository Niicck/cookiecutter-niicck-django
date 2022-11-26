.PHONY: install pre-commit type-check .env

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
	cp ./scripts/template.env .env
