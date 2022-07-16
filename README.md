# k8s-app-azure
UNIR 2022

Crear infraestructura en Azure bajo el modelo de Infraestructura como código ( IaC ) utilizando Terraform

Automatizar las instalaciones y configuraciones del entorno utilizando Ansible como herramienta de gestión de la configuración.

Instalar un cluster de Kubernetes para orquestación de contenedores.

Desplegar una
aplicación persistente sobre Kubernetes con
almacenamiento de tipo NFS

## Estructura

├── ansible
│   ├── deploy.sh
│   ├── hosts
│   ├── playbook.yml
│   └── roles
│       ├── role1
│       ├── role2
│       └── role3
└── terraform
    ├── correccion-vars.tf
    ├── main.tf
    └── recursos.tf

