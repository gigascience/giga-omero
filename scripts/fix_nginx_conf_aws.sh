#!/usr/bin/env bash

sed -i 's/http {/http {\n    server_names_hash_bucket_size 128;\n/g' /etc/nginx/nginx.conf