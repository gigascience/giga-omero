#!/usr/bin/env bash

sudo wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -ivh epel-release-latest-7.noarch.rpm
sudo yum install -y librsync rdiff-backup

sudo rdiff-backup --restore-as-of now --force /vagrant/backup/data /OMERO
