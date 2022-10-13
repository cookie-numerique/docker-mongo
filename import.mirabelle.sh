#!/bin/bash

if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

docker exec -ti --user www-data mongodb mongorestore --ssl -u $MONGO_USER_RESTORE -p $MONGO_PASS_RESTORE --tlsInsecure /database-backup --drop
