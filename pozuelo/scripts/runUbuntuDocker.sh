#!/bin/bash
# Despliegue del container Ubuntu 20.04.4
# El container contendrá la instalación de TERRAFORM, Azure CLI y ANSIBLE.

docker pull ubuntu:focal

# Ejecución básica
# docker run --name unirTerraform -it ubuntu:focal

# En mi caso quiero tener acceso a los archivos del proyecto, por lo que coloco un bind.
docker run --name unir_Terraform -it --mount type=bind,source=/Users/pozuelo/Desktop/k8s-app-azure/,target=/opt/terraform unir_terraform

# Se ejecuta une vez dentro del container Ubuntu 20.04.4
apt-get update

# Instalamos sudo
apt-get -y install sudo