#!/usr/bin/env bash

# Install tools
sudo yum install -y git wget
# Install rdiff-backup tool
sudo wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -ivh epel-release-latest-7.noarch.rpm
sudo yum install -y librsync rdiff-backup

sudo wget -O /vagrant/omero-data.tar.gz "https://drive.google.com/uc?export=download&id=1hu8iR_jDl0NRL8ETUBuG3qy_jvrbifjK"
sudo tar -xvf /vagrant/omero-data.tar.gz -C /vagrant