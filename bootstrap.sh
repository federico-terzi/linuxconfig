#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Bootstrapping linux config..."

apt update

echo "Installing basic packages..."

apt install -y git
apt install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible

echo "Getting the repository..."

git clone https://github.com/federico-terzi/linuxconfig.git

echo "Starting Ansible..."

ansible-playbook ~/linuxconfig/local.yml
