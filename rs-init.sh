#!/bin/bash
#? https://blog.devgenius.io/how-to-deploy-a-mongodb-replicaset-using-docker-compose-a538100db471
#? https://github.com/prisma/prisma/tree/main/docker

DELAY=25

mongosh admin <<EOF
rs.initiate({
  _id: '${MONGO_REPLICA_ID}',
  members: [
    {
      _id: 0,
      host: '${MONGO_REPLICA_HOST_PRIMARY}:27017',
    },
  ],
})
EOF
# { _id: 1, host: '${MONGO_REPLICA_HOST_SECONDARY}:27017' }

sleep $DELAY

mongosh admin <<EOF
db.createUser({
  user: '${MONGO_INITDB_ROOT_USERNAME}',
  pwd: '${MONGO_INITDB_ROOT_PASSWORD}',
  roles: ['root'],
})
EOF
