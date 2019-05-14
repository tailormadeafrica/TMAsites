#!/bin/sh
rake db:create
rake db:migrate

rm -f /server.pid
rm -rf /app/tmp/pids

exec "$@"