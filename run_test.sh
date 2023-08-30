#!/bin/sh

if [[ ! $(tfenv --version) ]]; then
  if [[ ! $(./tf1_5/terraform -version) ]]; then
    echo "Could not find terraform executable in tf1_5 directory, please install a TF 1.5.X binary in the tf1_5 directory"
    invalid=1
  fi
  if [[ ! $(./tf1_X/terraform -version) ]]; then
    echo "Could not find terraform executable in tf1_X directory, please install a TF < 1.5 binary in the tf1_X directory"
    invalid=1
  fi
  if [[ $invalid ]]; then
    exit 1
  fi
fi

RPWD=$(pwd)
cd tf1_5 && terraform init && terraform apply -auto-approve && cd $RPWD
cd tf1_X && terraform init && terraform plan && cd $RPWD
