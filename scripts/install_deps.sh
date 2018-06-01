#!/usr/bin/env bash

# Install tools
sudo yum install -y git wget

# Install rdiff-backup tool
sudo wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -ivh epel-release-latest-7.noarch.rpm
sudo yum install -y librsync rdiff-backup