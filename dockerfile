FROM dunglas/frankenphp AS base

WORKDIR /app/public

ENV SERVER_NAME=:80 \
    SERVER_PORT=80

FROM base AS dev
ENV APP_ENV=dev

FROM base AS test
ENV APP_ENV=test
COPY . /app/public

FROM base AS prod
ENV APP_ENV=prod
COPY . /app/public