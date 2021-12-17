#!/bin/bash

cd ~/workspace/build-image-k8s
VERSAO=$(git describe --tags $(git rev-list --tags --max-count=1))

cd ~/workspace/build-image-k8s/0-infra/0-terraform
RESOURCE_ID=$(terraform output | grep resource_id | awk '{print $2;exit}' | sed -e "s/\",//g")

cd ../2-ami-build
terraform init
TF_VAR_versao=$AMI_VERSION TF_VAR_resource_id=$RESOURCE_ID terraform apply -auto-approve