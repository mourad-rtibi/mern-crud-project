#!/bin/bash
container_name="mongo-primary"
docker compose -f "docker-compose.yml" up -d
until [ "$(docker container inspect -f '{{.State.Running}}' ${container_name})" == "true" ]; do
  sleep 1
done

docker exec ${container_name} /scripts/rs-init.sh

# docker exec ${container_name} mongosh admin --eval "rs.status()"
