#!/bin/bash

# Arrêter et supprimer les conteneurs existants
docker stop client comments event-bus moderation posts query
docker rm client comments event-bus moderation posts query

# Redémarrer les services avec les nouvelles configurations
docker run -d --name client -p 3000:3000 client
docker run -d --name comments -p 4001:4001 comments
docker run -d --name event-bus -p 4005:4005 event-bus
docker run -d --name moderation -p 4003:4003 moderation
docker run -d --name posts -p 4000:4000 posts
docker run -d --name query -p 4002:4002 query

echo "Les services ont été redémarrés avec succès."
