#!/bin/bash
set -eu
ansible-playbook -v --inventory "$1," --user pi ansible/playbook.yml
