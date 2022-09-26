
print('Start #################################################################');

print(process.env);
db = db.getSiblingDB("mirabelle");

db.createUser({
  user: process.env.MONGO_USER_MIKA,
  pwd:  process.env.MONGO_PASSWORD_MIKA,
  roles: [{ role: 'root', db: 'admin' }],
});

db.createUser({
  user: process.env.MONGO_USER_MARIE,
  pwd: process.env.MONGO_DB_MARIE,
  roles: [
    {
      role: "read",
      db: "mirabelle",
    },
  ],
});

print('END #################################################################');
