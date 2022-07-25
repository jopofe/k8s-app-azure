resource "azurerm_public_ip" "ip_public_nfs" {
  name                = "PublicIpNFS"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

  tags = {
    environment = "NFS"
  }
}

resource "azurerm_network_interface" "nic_nfs" {
  name                = "vnicNFS"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.10.12"
    public_ip_address_id          = azurerm_public_ip.ip_public_nfs.id # Public IP
  }
}


resource "azurerm_network_security_group" "sec_group_nfs" {
    name                = "secGroupNFS"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "NFS"
    }
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association
resource "azurerm_network_interface_security_group_association" "sec_group_association_nfs" {
    network_interface_id      = azurerm_network_interface.nic_nfs.id
    network_security_group_id = azurerm_network_security_group.sec_group_nfs.id
}

resource "azurerm_linux_virtual_machine" "vm_nfs" {
  name                = "vmNFS"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = var.ssh_user
  network_interface_ids = [
    azurerm_network_interface.nic_nfs.id,
  ]

  admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  plan {
    name      = "centos-8-stream-free"
    product   = "centos-8-stream-free"
    publisher = "cognosys"
  }

  source_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-stream-free"
    sku       = "centos-8-stream-free"
    version   = "22.03.28"
  }
}
