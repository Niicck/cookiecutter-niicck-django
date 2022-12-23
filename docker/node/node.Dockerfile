FROM node:19-bullseye-slim

WORKDIR /app

COPY ./package.json /app
COPY ./package-lock.json /app

RUN npm install && npm cache clean --force

ENTRYPOINT npm run watch:tailwind
