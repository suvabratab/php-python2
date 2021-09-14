#!/bin/bash

printf "Enabling Cloud Build APIs..."
gcloud services enable cloudbuild.googleapis.com > /dev/null 2>&1
printf "Completed.\n"

printf "Building product Container..."
gcloud builds submit --tag gcr.io/${GOOGLE_CLOUD_PROJECT}/product:1.0.0 . > /dev/null 2>&1
printf "Completed.\n"

printf "Deploying Product To GKE Cluster..."
kubectl create deployment product --image=gcr.io/${GOOGLE_CLOUD_PROJECT}/product:1.0.0 > /dev/null 2>&1
kubectl expose deployment product --type=LoadBalancer --port 80 --target-port 5000 > /dev/null 2>&1
printf "Completed.\n\n"

printf "Please run the following command to find the IP address for the monolith service:  kubectl get service product\n\n"

printf "Deployment Complete\n"