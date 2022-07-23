#!/bin/bash
# Instalar y Levantar FW
sudo dnf -y install firewalld
sudo systemctl enable firewalld --now

# Instalación NFS
sudo dnf -y install nfs-utils
sudo mkdir -p /mnt/app
sudo chown -R nobody: /mnt/app/
sudo chmod -R 777 /mnt/app/
sudo bash -c "cat <<EOF > /etc/exports
/mnt/app  192.168.56.0/24(rw,sync,no_subtree_check)
EOF"
sudo systemctl enable nfs-server --now
sudo exportfs -arv
sudo exportfs -s
for service in nfs rpc-bind mountd;do sudo firewall-cmd --add-service=${service} --permanent;sudo firewall-cmd --reload;done