#!/bin/bash 
kubectl apply -f a01_Namespace.yml
kubectl apply -f a03_Secret.yml
kubectl apply -f a02_Deployment.yml
kubectl apply -f a04_Service_NodePort.yml
