#!/bin/bash

kubectl apply -f roles.yaml

openssl genrsa -out alice.key 2048
openssl req -new -key alice.key -out alice.csr -subj "/CN=alice/O=propdevelopment-org"
kubectl certificate approve alice
kubectl config set-credentials alice --client-key=./alice.key --client-certificate=./alice.crt
kubectl config set-context alice-context --cluster=minikube --user=alice



openssl genrsa -out bob.key 2048
openssl req -new -key bob.key -out bob.csr -subj "/CN=bob/O=propdevelopment-org"
kubectl certificate approve bob
kubectl config set-credentials bob --client-key=./bob.key --client-certificate=./bob.crt
kubectl config set-context bob-context --cluster=minikube --user=bob



kubectl apply -f rolebinding.yaml

