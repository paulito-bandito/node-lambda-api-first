#!/bin/bash

docker-compose down

#
docker network rm project-docker-node_default
docker network rm project_default

#
docker volume rm project-docker-node_postgis_data
docker volume prune -f