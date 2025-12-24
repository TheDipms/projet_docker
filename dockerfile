   # Stage de base
   FROM dunglas/frankenphp AS base

   WORKDIR /app

   # Copier Caddyfile
   COPY Caddyfile /etc/caddy/Caddyfile

   # Copier tout le projet
   COPY . /app

   # Définir le serveur sur le port 80
   ENV SERVER_NAME=:80

   # Stage dev
   FROM base AS dev
   ENV APP_ENV=dev
   CMD ["frankenphp", "run"]

   # Stage test
   FROM base AS test
   ENV APP_ENV=test
   CMD ["frankenphp", "run"]

   # Stage prod
   FROM base AS prod
   ENV APP_ENV=prod
   CMD ["frankenphp", "run"]
