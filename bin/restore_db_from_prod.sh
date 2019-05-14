#!/bin/sh

heroku pg:backups capture
curl -o /tmp/latest.dump `heroku pg:backups public-url -r heroku`
PGPASSWORD=tma psql -h localhost -p 5432 -U tma -d tma_dev -c "DROP DATABASE tma_dev;"
PGPASSWORD=tma psql -h localhost -p 5432 -U tma -d tma_dev -c "CREATE DATABASE tma_dev;"
PGPASSWORD=tma pg_restore --verbose --clean --no-acl --no-owner -h localhost -U tma -d tma_dev /tmp/latest.dump