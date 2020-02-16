FROM redis:4.0.13

ADD conf/redis.conf /usr/local/etc/redis/redis.conf

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

EXPOSE 6379