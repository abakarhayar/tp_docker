#!/bin/bash

# Construire les images Docker pour chaque service
echo "Construction des images Docker pour chaque service..."

docker build -t client ./client
docker build -t comments ./comments
docker build -t event-bus ./event-bus
docker build -t moderation ./moderation
docker build -t posts ./posts
docker build -t query ./query

echo "Images Docker construites avec succès."

# Déployer l'Ingress Nginx
echo "Déploiement de l'Ingress Nginx..."

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml

echo "Ingress Nginx déployé avec succès."

# Appliquer les fichiers de déploiement Kubernetes
echo "Application des fichiers de déploiement Kubernetes..."

kubectl apply -f infra/k8s/client-deployment.yaml
kubectl apply -f infra/k8s/comments-deployment.yaml
kubectl apply -f infra/k8s/event-bus-deployment.yaml
kubectl apply -f infra/k8s/moderation-deployment.yaml
kubectl apply -f infra/k8s/posts-deployment.yaml
kubectl apply -f infra/k8s/query-deployment.yaml

# Appliquer le fichier d'Ingress
echo "Application du fichier d'Ingress..."

kubectl apply -f infra/k8s/ingress.yaml

echo "Toutes les ressources Kubernetes ont été appliquées."

# Vérification de l'état des pods, services, et ingress
echo "Vérification de l'état des pods et des services..."

kubectl get pods
kubectl get services
kubectl get ingress

echo "Vérification terminée."

echo "Script d'installation terminé."
