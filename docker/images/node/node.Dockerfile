FROM node:19-bullseye-slim

# Set working directory
ARG APP_HOME=/app
WORKDIR ${APP_HOME}

# Install node modules
COPY ./package.json /app
COPY ./package-lock.json /app
RUN npm install && npm cache clean --force

# Copy application code to WORKDIR
COPY . ${APP_HOME}

ENTRYPOINT ./docker/images/node/scripts/entrypoint.sh
