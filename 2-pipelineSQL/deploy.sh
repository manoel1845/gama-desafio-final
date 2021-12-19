#!/bin/bash

cd 2-pipelineSQL/terraform
terraform init
terraform apply -auto-approve

echo "Passo 1 - Aguardando criação de maquinas..."
sleep 10 # 10 segundos

echo $"[ec2-mysql-dev]" > ../ansible/hosts # cria arquivo
echo "$(terraform output | grep mysql_instance_1 | awk '{print $3;exit}' | sed -e "s/\",//g")" >> ../ansible/hosts # captura output faz split de espaco e replace de ",
echo $"[ec2-mysql-stag]" >> ../ansible/hosts # cria arquivo
echo "$(terraform output | grep mysql_instance_2 | awk '{print $3;exit}' | sed -e "s/\",//g")" >> ../ansible/hosts # captura output faz split de espaco e replace de ",
echo $"[ec2-mysql-prod]" >> ../ansible/hosts # cria arquivo
echo "$(terraform output | grep mysql_instance_3 | awk '{print $3;exit}' | sed -e "s/\",//g")" >> ../ansible/hosts # captura output faz split de espaco e replace de ",


echo "Aguardando criação de maquinas ..."
sleep 10 # 10 segundos

cd ../ansible

echo $"[client]" > dumpsql/.my.cnf
echo $"user=root" >> dumpsql/.my.cnf
echo $"password=$PASSWORD" >> dumpsql/.my.cnf

#ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key ~/.ssh/chaveprivada.pem

echo "Executando ansible ::::: [ ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /var/lib/jenkins/kp-mineiro.pem ]"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /var/lib/jenkins/kp-mineiro.pem

echo $"[client]" > dumpsql/.my.cnf
echo $"user=root" >> dumpsql/.my.cnf
echo $"password=" >> dumpsql/.my.cnf