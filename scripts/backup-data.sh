#!/bin/bash

FROM=/OMERO
TO=/vagrant/backup/data

rdiff-backup $FROM $TO
