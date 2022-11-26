###
# base image
###
FROM python:3.11-slim-bullseye as base

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    PYSETUP_PATH="/opt/pysetup" \
    VENV_PATH="/opt/pysetup/.venv"

# Install apt packages
RUN apt-get update && apt-get install --no-install-recommends -y \
    # For building Python packages
    build-essential \
    # psycopg2 dependencies
    libpq-dev \
    # For troubleshooting
    curl

# Set working directory
ARG APP_HOME=/app
WORKDIR ${APP_HOME}

# Install python packages
COPY pyproject.toml poetry.lock ./

# Copy in entrypoint
COPY ./docker/docker-entrypoint.sh ./docker-entrypoint.sh
RUN chmod +x ./docker-entrypoint.sh

# Copy application code to WORKDIR
COPY . ${APP_HOME}

ENTRYPOINT ./docker-entrypoint.sh $0 $@
CMD ["python", "./manage.py", "runserver", "0.0.0.0:80"]

###
# local image
###
FROM base as local

RUN poetry install --dev

###
# deployed image
###
FROM base as deployed

RUN poetry install --no-dev
