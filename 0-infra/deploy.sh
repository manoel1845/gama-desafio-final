#!/bin/bash

cd 0-terraform
terraform init
terraform apply -auto-approve

echo "Aguardando criação de maquinas ..."
#sleep 10 # 10 segundos

echo $"[ec2-img]" > ../1-ansible/hosts # cria arquivo
echo "$(terraform output | grep public_ip | awk '{print $2;exit}')" | sed -e "s/\",//g" >> ../1-ansible/hosts # captura output faz split de espaco e replace de ",

echo "Aguardando criação de maquinas ..."
#sleep 10 # 10 segundos

cd ../ansible

echo "Executando ansible ::::: [ ansible-playbook -i hosts provisionar.yaml -u ubuntu --private-key /var/lib/jenkins/kp-mineiro.pem ]"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionar.yaml -u ubuntu --private-key /var/lib/jenkins/kp-mineiro.pem