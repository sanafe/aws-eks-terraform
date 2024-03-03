#!/bin/bash

mkdir -p common
mkdir -p sonarqube
mkdir -p nexus
mkdir -p grafana
mkdir -p terraform

touch common/vpc.tf
touch common/eks-cluster.tf
touch common/outputs.tf
touch sonarqube/deployment.yaml
touch sonarqube/service.yaml
touch nexus/deployment.yaml
touch nexus/service.yaml
touch grafana/deployment.yaml
touch grafana/service.yaml
touch terraform/variables.tf
touch terraform/provider.tf
touch terraform/terraform.tfstate
touch README.md

