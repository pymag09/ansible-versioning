#!/bin/bash

git clone https://github.com/pymag09/ansible-versioning.git
cd ansible-versioning
git checkout $1
ansible-galaxy install -r requirements.yaml -p .
ansible-playbook -i hosts/localhost playbook.yml
