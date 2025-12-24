Projet Docker – FrankenPHP + PostgreSQL
Description

Ce projet met en place une application PHP servie par FrankenPHP (Caddy + PHP) et une base de données PostgreSQL, le tout orchestré avec Docker Compose.

L’objectif est de disposer d’un environnement clé en main, fonctionnel sur Windows, avec :

un serveur web PHP accessible depuis le navigateur

une base PostgreSQL persistante

des healthchecks pour vérifier l’état des services

Prérequis

Windows 10/11

Docker Desktop installé et démarré

WSL2 activé (recommandé par Docker Desktop)

Vérification :
docker --version
docker compose version

Contenu principal
index.php (exemple)

<?php
echo "🔥 FrankenPHP OK";

docker-compose (compose.yaml):

services:
  app:
    image: monapp:dev
    build:
      context: projet_docker/application
      target: dev
    ports:
      - "8081:80"
    volumes:
      - ./public:/app/public
      - type: bind
        source: C:\Projet_docker\projet_docker\application\public
        target: /app/public
    environment:
      SERVER_ROOT: /app/public
      SERVER_NAME: :80
    healthcheck:
      test: [ "CMD", "curl", "-f", "http://localhost" ]
      interval: 10s
      timeout: 5s
      retries: 5
  database:
    image: postgres:16-alpine
    ports:
      - "5432:5432"
    environment:
      POSTGRES_DB: app
      POSTGRES_USER: app
      POSTGRES_PASSWORD: change_me
    volumes:
      - database_data:/var/lib/postgresql/data

volumes:
  database_data:

Lancement du projet

Depuis le dossier application :

docker compose up --build
Application PHP :

http://localhost:8081


Le localhost me renvoie une erreur 404 et une fois que je l'ai réglé mon fichier dockerfile bien que n'ayant pas bougé n'étais plus reconue et donc aucun container ne démarrais.

Commandes utiles

Arrêter les services :

docker compose down

Voir les logs :

docker logs projet_docker-app-1

Entrer dans le conteneur :
docker exec -it projet_docker-app-1 sh
Conclusion:
je n'ai pas reussi ce projet 
