#!/bin/bash
ansible-playbook -i hosts playbookCommon.yml
ansible-playbook -i hosts playbookDeployments.yml