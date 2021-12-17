#!/bin/bash

cd ~/workspace/build-image-k8s/0-infra/0-terraform
terraform destroy -target aws_instance.build_k8s -target aws_security_group.sg_image_k8s -auto-approve