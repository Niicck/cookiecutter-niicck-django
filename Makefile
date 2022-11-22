# Run pre-commit without commiting.
pre-commit:
	pre-commit

# Run mypy type checking
mypy:
	poetry run mypy niicck_django_cookiecutter

# Create .env from template if .env doesn't already exist
.env:
	cp ./scripts/.env-template .env
