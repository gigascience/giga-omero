#!/bin/bash

DATE=`date '+%Y-%m-%d_%H:%M:%S-%Z'`
OUTPUT_DIRECTORY=/tmp/backup
DATABASE="omero_database"
DATABASE_ADMIN="postgres"

mkdir -p $OUTPUT_DIRECTORY
chown -R $DATABASE_ADMIN $OUTPUT_DIRECTORY
su $DATABASE_ADMIN -c "pg_dump -Fc -f $OUTPUT_DIRECTORY/$DATABASE.pg_dump $DATABASE"