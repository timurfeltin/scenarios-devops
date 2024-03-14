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
  replicas: 0
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
          env:
            - name: TEST_KEY
              valueFrom:
                configMapKeyRef:
                  name: config
                  key: config

EOF
