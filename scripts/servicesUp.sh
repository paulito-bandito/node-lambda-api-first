#!/bin/bash
set -a
source .env
docker-compose up --build --remove-orphans --renew-anon-volumes