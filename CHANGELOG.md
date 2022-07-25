# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2022-07-16
### Added
- Versión inicial de código.

## [1.1.0] - 2022-07-16
### Added
- Se crea la carpeta pozuelo que contiene información importante para el desarrollo del caso práctico.
- Se crea la carpeta pozuelo/scripts que contiene scripts de relevancia para el desarrollo de la práctica.
- Se añade el fichero "terraformInstall.sh" que contiene los pasos de ejecución para la instalación de TERRAFORM en un Docker container de Ubuntu 20.04.4.
- Se añade el fichero "runUbuntuDocker.sh" que ejecutará el container Ubuntu 20.04.4.

## [1.2.0] - 2022-07-16
### Added
- Se crea script de instalación "azureCLIInstall" de azure-cli para el container de Ubuntu desplegado.

## [2.0.0] - 2022-07-16
### Added
- Se crea script "azureCLILogin.sh" para facilitar el login en AZ.
- Se crea script "sshKeyGen.sh" para la generación de las keys. La pública se pasará como variable a través de TERRAFORM a las nuevas máquinas.
- Se crea script "terraformRun.sh" con los pasos de ejecución de TERRAFORM siguiendo las buenas prácticas.
- Se crea carpeta de logs en /pozuelo/logs

### Changed
- Se añaden datos en README.md.
- Se modifican los ficheros relativos a terraform. Despliegue de una única VM en AZURE mediante TERRAFORM.

## [2.1.0] - 2022-07-17
### Added
- Se realiza el despliegue de las 3 VMs necesarias para el desarrollo de la práctica. El proceso y las decisiones tomadas se incluirán en la memoria.
- Se crea el fichero de "outputs.tf" para obtener las salidas tras la ejecución de TERRAFORM.
- Se añaden los ficheros "node_*.tf" con los recursos de creación de cada VM por separado, para tener un orden de estructura.

### Changed
- Se modifican las variables de "correccion-vars.tf".
- Se añaden líneas de comentarios en "terraformRun.sh".

## [2.2.0] - 2022-07-18
### Added
- Se realiza el despliegue de las 3 VMs necesarias para el desarrollo de la práctica en local mediante VAGRANT.
- Se crea la carpeta vagrant y se incluye el archivo "Vagrantfile"
- Se incluyen los logs de este despliegue en /pozuelo/vagrant/
- Se crea el script "nfsDeploy.sh" que automatiza la instalación del NFS que se hará después con ANSIBLE.

### Changed
- Se renombra el archivo "terraform.log" por "singleVM.log" y se lleva a una nueva ubicación: /pozuelo/logs/terraform/

## [3.0.0] - 2022-07-19
### Added
- Creación de scripts "vagrantRun.sh" y "vagrantInstall.sh".
- Creación del script de instalación de ANSIBLE "ansibleInstall.sh".
- Se crea el dichero "nfsDeploy.log" resultado del script de despliegue en VM local.
- Creación de directorios y ficheros para el despligue de NFS con ANSIBLE, incluyendo el rol.

### Changed
- Modificación del usuario "admin_username" de las VMs a "ansible" en los ficheros de TERRAFORM.

## [3.1.0] - 2022-07-20
### Added
- Creamos fichero de variables para facilitar la creación de YAML.
- Instalamos colecciones de ANSIBLE para poder utilizar ciertos módulos.
- Separamos "playbookCommon.yml" y "playbookDeployments.yml" para los procesos comunes y el despliegue de NFS y K8s.
- Se consigue desplegar los requirements de K8s via ANSIBLE.

### Changed
- Se modifican los ficheros de variables para establecer los hostname.

## [3.2.0] - 2022-07-21
### Added
- Se guarda joinToken para que se pueda observar el comando ejecutado para unir un worker a un cluster.
- Se despliega el cluster de K8s completo a través de los 4 roles.
- Se modifica "deploy.sh".

### Changed
- Modificamos las IPs asignadas con TERRAFORM para que sean estáticas.

## [4.0.0] - 2022-07-24
### Added
- Se despliega el cluster de K8s completo.
- Se despliega GRAFANA como container para ser ejecutado en el cluster, y se accede de forma correcta.
- Se hace uso del NFS compartido para persistir los datos.
- Se crea un nuevo rol de app en ANSIBLE para desplegar la aplicación.
- En el rol de 'k8s' se añade el montaje del path para el NFS para las máquinas MASTER y WORKER.
- Para poder hacer uso de los datos persistentes del NFS.
- se crea dentro del rol de 'app' en el directorio de files, los archivos YAML necesarios para el despliegue de la aplicación GRAFANA, concretamente la última versión 9.0.4.

### Changed
- Se mergea parte del código en playbookCommon.yaml ya que la creación del directorio compartido así como la instalación de NFS utils debe realizarse en todas las máquinas.
- Se modifica el inventario "hosts" de ANSIBLE para que se pueda acceder a las máquinas sin la confirmación de la relación de confianza entre hosts. Se sustituyen las IPs por los nombres de dominio de cada VM.

## [4.0.1] - 2022-07-25
### Added
- Se añaden los security groups en las VM en los ficheros de TERRAFORM.
- Se añade todo el log de una ejecución completa de las 3 VMs en "pozuelo/logs/terraform" y en "pozuelo/logs/ansible"
- se comenta "deploy.sh".
- Se añade referencia a los ficheros de files para el rol de GRAFANA en las variables.

### Changed
- Se añade información al README.md
- Se cambian de directorio los files para el despliegue de GRAFANA.