#!/bin/bash
# Ansible 2.9 Installation
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#id10
# https://docs.ansible.com/ansible/latest/roadmap/ROADMAP_2_9.html#release-schedule

python3 --version
sudo apt-get install python3-pip

python3 -m pip -V
pip install ansible==2.9

ansible-galaxy collection install ansible.posix