#!/bin/bash
kubectl apply -f a01_namespace.yml
kubectl apply -f a03_secret.yml
kubectl apply -f a02_Deployment.yml
kubectl apply -f a04_Service_NodePort.yml
