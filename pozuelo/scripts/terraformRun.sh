# Pasos de ejecución de Terraform

terraform init
terraform fmt
terraform validate

terraform plan
# terraform plan -out=singleVM

terraform apply
# terraform apply singleVM

# Aceptar términos legales
# az vm image terms accept --offer centos-8-stream-free --plan 10398870-f8a7-4284-9317-a78477bd3633 --publisher cognosys

# Destruir
# terraform destroy