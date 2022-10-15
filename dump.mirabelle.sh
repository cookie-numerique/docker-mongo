#!/bin/bash
pathEnv=/opt/docker-apps/docker-mongo/.env;

if [ -f $pathEnv ]; then
  export $(echo $(cat $pathEnv | sed 's/#.*//g'| xargs) | envsubst)
fi

pathDump="$BACKUP_DIR$(date +'%m-%d-%Y')"

echo "Sauvegarde dans $pathDump ...";

docker exec -ti mongodb mongodump -u $MONGO_USER_BACKUP -p $MONGO_PASS_BACKUP --authenticationDatabase admin -d mirabelle -o $pathDump --ssl --tlsInsecure;

echo 'Sauvegarde terminé';

