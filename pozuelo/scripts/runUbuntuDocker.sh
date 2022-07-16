# Despliegue del container Ubuntu 20.04.4
# El container contendrá la instalación de TERRAFORM, Azure CLI y ANSIBLE.

docker pull ubuntu:focal
docker run --name unirTerraform -it ubuntu:focal