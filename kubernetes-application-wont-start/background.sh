#!/bin/bash
kubectl create ns production
cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: some-prod-app
  namespace: production
  labels:
    app: some-prod-app
spec:
  replicas: 4
  selector:
    matchLabels:
      app: some-prod-app
  template:
    metadata:
      labels:
        app: some-prod-app
    spec:
      containers:
        - name: some-prod-app-container
          image: httpd:latest
          ports:
            - containerPort: 80

EOF