#!/usr/bin/env bash

set -eoux pipefail

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# minikube start --driver=virtualbox --cpus=3 --memory=5000
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

kubectl create namespace elastic-stack

helm install elasticsearch ./helm-charts/elasticsearch \
  --namespace=elastic-stack \
  --values=scripts/values/elasticsearch.yaml

helm install kibana ./helm-charts/kibana \
  --namespace=elastic-stack \
  --values=scripts/values/kibana.yaml

set +x

printf "\n"
echo "kubectl port-forward --namespace=elastic-stack svc/elasticsearch-master 9200"
echo "Access: http://localhost:9200"

printf "\n"
echo "kubectl port-forward --namespace=elastic-stack svc/kibana-kibana 5601"
echo "Access: http://localhost:5601"

printf "\n"
