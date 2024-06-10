#!/bin/sh


docker compose build
docker compose up -d
ansible-playbook -i inventory playbook.yaml