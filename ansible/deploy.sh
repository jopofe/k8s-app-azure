#!/bin/bash

# Script que ejecuta secuencialmente los playbooks para la completa instalación de la solución.
# Consultar el directorio "pozuelo/scripts" para ver los logs de la ejecución.
# Ejecución del playbook con los requisitos comunes.
ansible-playbook -i hosts playbookCommon.yml
# Ejecución del playbook que incluye todos los roles.
ansible-playbook -i hosts playbookDeployments.yml