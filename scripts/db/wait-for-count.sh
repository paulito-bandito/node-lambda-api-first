#!/bin/bash
set -e

# @see https://www.marksayson.com/blog/wait-until-docker-containers-initialized/

# Max query attempts before consider setup failed
MAX_TRIES=20

# Returns a true-like value if and only if a query
# with the expected db and user succeeds
function dbIsReady() {
  PGPASSWORD=green_pass \
  psql -h postgis -U green_user \
       -d project -c "select 1" \
  > /dev/null 2>&1
}

echo "Wait for PostgreSQL to become available..."
sleep 5
until dbIsReady || [ $MAX_TRIES -eq 0 ]; do
  echo "Waiting for PostgreSQL server, $((MAX_TRIES--)) remaining attempts..."
  sleep 5
done

if [ $MAX_TRIES -eq 0 ]
then
  echo "Error: PostgreSQL not responding, cancelling server set up"
  exit 1
fi

echo "PostgreSQL ready, starting application..."