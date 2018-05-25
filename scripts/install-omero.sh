#!/usr/bin/env bash

# Install tools
sudo yum install -y git rdiff-backup

cd /vagrant
git clone https://github.com/ome/omero-install.git

# Omero is installed in /home/omero
cd /vagrant/omero-install/linux
sudo bash install_centos7_nginx.sh

# Set hostname
sudo hostnamectl set-hostname localhost

# Reload systemd manager configuration
sudo systemctl daemon-reload

# Run OMERO server
sudo systemctl enable omero.service
sudo systemctl stop omero.service
sudo systemctl start omero.service

# Run OMERO web client
sudo systemctl enable omero-web.service
sudo systemctl stop omero-web.service
sudo systemctl start omero-web.service