#!/usr/bin/env bash

sudo rdiff-backup --restore-as-of now --force /vagrant/backup/data /OMERO
