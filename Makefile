# Run pre-commit without commiting.
pre-commit:
	pre-commit

# Run mypy type checking
mypy:
	poetry run mypy niicck_django_cookiecutter

start-venv:
	source venv/bin/activate

stop-venv:
	deactivate
