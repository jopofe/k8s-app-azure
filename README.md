# k8s-app-azure
UNIR 2022 - Jorge Pozuelo Fernández

Crear infraestructura en Azure bajo el modelo de Infraestructura como código ( IaC ) utilizando Terraform
Automatizar las instalaciones y configuraciones del entorno utilizando Ansible como herramienta de gestión de la configuración.
Instalar un cluster de Kubernetes para orquestación de contenedores.
Desplegar una aplicación persistente sobre Kubernetes con almacenamiento de tipo NFS

# Formato del Repositorio Git

El repositorio debe tener el siguiente formato:

```
├── ansible
│   ├── deploy.sh
│   ├── hosts
│   ├── playbook.yml
│   └── roles
│       ├── role1
│       ├── role2
│       └── role3
└── terraform
    ├── correccion-vars.tf
    ├── main.tf
    └── recursos.tf
```

El directorio **ansible** debe contener:

* deploy.sh - Script de bash que ejecuta el playbook de Ansible.

* hosts - Fichero de inventario

```
[all:vars]
ansible_user=<USUARIO>

[master]
master

[workers]
worker1
worker2

[nfs]
nfs
```

* playbook.yml - Uno o más ficheros de playbook.

* roles - Directorio que incluye los roles a utilizar por Ansible.

El directorio **terraform** debe incluir:

* correccion-vars.tf - Fichero que incluye las siguientes variables:

```
variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "<YOUR REGION>" 
}

variable "storage_account" {
  type = string
  description = "Nombre para la storage account"
  default = "<STORAGE ACCOUNT NAME>"
}

variable "public_key_path" {
  type = string
  description = "Ruta para la clave pública de acceso a las instancias"
  default = "~/.ssh/id_rsa.pub" # o la ruta correspondiente
}

variable "ssh_user" {
  type = string
  description = "Usuario para hacer ssh"
  default = "<SSH USER>"
}
```

* main.tf - Fichero que indica el proveedor y versiones a utilizar.

* recursos.tf - Uno o más ficheros definiendo los objectos a crear por Terraform.

# STEPS

Se crea el directorio **pozuelo** que contiene información importante para el desarrollo del caso práctico.
1. Despliegue Docker container Ubuntu 20.04.4
2. Instalación TERRAFORM
3. Instalación azure-cli

4. VMs:
- Selección de las máquinas a desplegar.
- Cumplir requisitos: IP pública, CPU, RAM...
5. Despliegue infra AZ TERRAFORM 1 VM.
6. Despliegue infra AZ TERRAFORM 3 VMs.
7. Despliegue 3 VMs con VAGRANT en local.
8. Despliegue ANSIBLE.

# NOTAS

- Hay que evitar incluir el fichero de providers resultado del init con TERRAFORM, ya que devolverá error al subirlo a GITHUB.


- Puedo ver que las reglas están correctamente abiertas con:
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-viewing_current_status_and_settings_of_firewalld#sec-Viewing_Current_firewalld_Settings

[ansible@vmNFS ~]$ sudo firewall-cmd --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: eth0
  sources:
  services: cockpit dhcpv6-client mountd nfs rpc-bind ssh
  ports:
  protocols:
  forward: no
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:

