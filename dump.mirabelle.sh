#!/bin/bash
pathEnv=/opt/docker-apps/docker-mongo/.env;

if [ -f $pathEnv ]; then
  export $(echo $(cat $pathEnv | sed 's/#.*//g'| xargs) | envsubst)
fi

echo "Sauvegarde dans $BACKUP_DIR ...";

docker exec -ti mongodb mongodump -u $MONGO_USER_BACKUP -p $MONGO_PASS_BACKUP --authenticationDatabase admin -d mirabelle -o $BACKUP_DIR --ssl --tlsInsecure;

echo 'Sauvegarde terminé';

