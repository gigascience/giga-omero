#!/usr/bin/env bash

OMERO_DB_USER=db_user
OMERO_DB_PASS=db_password
OMERO_DB_NAME=omero_database

DATABASE_ADMIN="postgres"
DB_DUMP_FILE="/vagrant/backup/omero_database.pg_dump"

su $DATABASE_ADMIN -c "dropdb --if-exists '$OMERO_DB_NAME'"
su $DATABASE_ADMIN -c "createdb -E UTF8 -O '$OMERO_DB_USER' '$OMERO_DB_NAME'"
su $DATABASE_ADMIN -c "pg_restore -Fc -d '$OMERO_DB_NAME' '$DB_DUMP_FILE'"
