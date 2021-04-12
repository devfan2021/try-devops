docker run -d -p 6300:6379 \
  -e ALLOW_EMPTY_PASSWORD=yes \
  -v /data/db-data/redis-stand-alone:/bitnami/redis/data \
  --name xrksudy.redis.stand-alone \
  bitnami/redis:latest