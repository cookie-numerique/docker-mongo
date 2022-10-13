if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

docker exec -ti mongodb mongodump -u $MONGO_USER_BACKUP -p $MONGO_PASS_BACKUP --authenticationDatabase admin -d mirabelle -o /database-backup --ssl --tlsInsecure;
