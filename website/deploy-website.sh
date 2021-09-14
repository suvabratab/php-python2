#!/bin/bash

printf "Enabling Cloud Build APIs..."
gcloud services enable cloudbuild.googleapis.com > /dev/null 2>&1
printf "Completed.\n"

printf "Building Website Container..."
gcloud builds submit --tag gcr.io/${GOOGLE_CLOUD_PROJECT}/website:1.0.0 . > /dev/null 2>&1
printf "Completed.\n"

printf "Deploying Website To GKE Cluster..."
kubectl create deployment website --image=gcr.io/${GOOGLE_CLOUD_PROJECT}/website:1.0.0 > /dev/null 2>&1
kubectl expose deployment website --type=LoadBalancer --port 80 --target-port 80 > /dev/null 2>&1
printf "Completed.\n\n"

printf "Please run the following command to find the IP address for the monolith service:  kubectl get service website\n\n"

printf "Deployment Complete\n"