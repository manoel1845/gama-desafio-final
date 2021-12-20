#!/bin/bash

cd 4-java_stage/ansible

echo "Executando ansible ::::: [ ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /var/lib/jenkins/kp-mineiro.pem ]"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionar.yaml -u ubuntu --private-key /var/lib/jenkins/kp-mineiro.pem