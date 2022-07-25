variable "resource_group_name" {
  default = "rg-pozuelo"
}

variable "location" {
  type        = string
  description = "Región de Azure donde crearemos la infraestructura"
  default     = "uksouth"
}

variable "network_name" {
  default = "vnet-pozuelo"
}

variable "subnet_name" {
  default = "subnet-pozuelo"
}

variable "ssh_user" {
  type        = string
  description = "Usuario para hacer ssh"
  # default     = "azureuser" # Usuario diferente de root
  default     = "ansible" # Necesario para ansible
}

variable "public_key_path" {
  type        = string
  description = "Ruta para la clave pública de acceso a las instancias"
  default     = "~/.ssh/id_rsa.pub" # Aquí se encuentra la clave pública.
}

variable "storage_account" {
  type        = string
  description = "Nombre para la storage account"
  default     = "pozuelo" # Para almacenar información del despliegue. Por el momento no se utiliza.
}