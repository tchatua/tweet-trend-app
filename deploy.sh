#!/bin/bash 
kubectl apply -f Kubernetes/a01_Namespace.yml
kubectl apply -f Kubernetes/a03_Secret.yml
kubectl apply -f Kubernetes/a02_Deployment.yml
kubectl apply -f Kubernetes/a04_Service_NodePort.yml
