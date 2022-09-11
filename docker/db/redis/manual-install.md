## Install Redis Using Source
* Downloading the source files
```
wget https://download.redis.io/redis-stable.tar.gz 
```
* Compiling Redis
```
tar -zxvf redis-stable.tar.gz
cd redis-stable
make

make install
```
binaries will generate in /usr/local/bin
* Config Redis
```
mkdir /etc/redis
mkdir /var/redis
cp utils/redis_init_script /etc/init.d/redis_6378
cp redis.conf /etc/redis/redis_6378.conf

mkdir /var/redis/6378
```

custom redis config
```
$ /etc/redis/redis_6378.conf

daemonize yes

pidfile /var/run/redis_6378.pid (modify the port according to your setting)
port 6380 (modify the port according to your setting)
loglevel notice (modify to your preferred level)
logfile /var/log/redis_6378.log
dir /var/redis/6378 (important)
```

* Start Redis Server
```
/etc/init.d/redis_6378 start
```




* [Install Redis from Source](https://redis.io/docs/getting-started/installation/install-redis-from-source/)
* [Redis How To: Installation, setup and configuration](https://severalnines.com/blog/redis-how-installation-setup-and-configuration/)