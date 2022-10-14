#!/bin/bash
pathEnv=/opt/docker-apps/mongo/.env;

if [ -f $pathEnv ]; then
  export $(echo $(cat $pathEnv | sed 's/#.*//g'| xargs) | envsubst)
fi

docker exec -ti --user www-data mongodb mongodump -u $MONGO_USER_BACKUP -p $MONGO_PASS_BACKUP --authenticationDatabase admin -d mirabelle -o /database-backup --ssl --tlsInsecure;

