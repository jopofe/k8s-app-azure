variable "resource_group_name" {
  default = "rg-pozuelo"
}

variable "location" {
  type        = string
  description = "Región de Azure donde crearemos la infraestructura"
  default     = "uksouth"
}

variable "network_name" {
  default = "vnet1"
}

variable "subnet_name" {
  default = "subnet1"
}

variable "ssh_user" {
  type        = string
  description = "Usuario para hacer ssh"
  default     = "azureuser" # Usuario
}

variable "public_key_path" {
  type        = string
  description = "Ruta para la clave pública de acceso a las instancias"
  default     = "~/.ssh/id_rsa.pub" # Aquí se encuentra la clave pública.
}

variable "storage_account" {
  type        = string
  description = "Nombre para la storage account"
  default     = "pozuelo" # Por el momento no se utiliza un storage account
}