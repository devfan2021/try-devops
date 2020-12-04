db.createUser({
  user: "user",
  pwd: "xrksudy-user#@!",
  roles: [ { role: "readWrite", db: "wiki" } ]
})

db.topic.insert({
  name: "user"
})