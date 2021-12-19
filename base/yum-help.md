## 镜像说明
* http://mirrors.163.com/.help/centos.html

## 运行以下命令生成缓存
* yum clean all
* yum makecache




## MongoDB授权
use wiki_info_v2
db.createUser({user: "xrksudylab", pwd: "xrksudy-discover-!@", roles: [{ role: "readWrite", db: "xxx2qi"}]})
db.updateUser( "xrksudylab", {roles : [ { role : "readWrite", db : "wiki_info_v2"  }, { role : "readWrite", db : "xxx2qi"  } ]})

## import表
mongoimport --host 127.0.0.1:27017 -u xrksudylab -p 'xrksudy-discover-!@' --authenticationDatabase=admin --db=wiki_info_v2 --collection=amusement --file=/mnt/db_backup/amusement

## mongodb还原数据
* mongorestore -h xxx.xxx.xxx.xxx -u root -p 'xrksudy-discover-!@' -d wiki_info_v2  backup_path

## Java问题
* https://juejin.im/post/5d1d5e60f265da1b67212b20

## docker导入导出镜像
* docker save -o xrksudy.wiki-aggregation.tar xrksudy.wiki-aggregation:latest
* docker load --input xrksudy.wiki-aggregation.tar




## docker network
frontend、backend 是需要手动创建的自定义network (例如：docker network create frontend)

这样就可以在compose文件中声明并使用了


## docker compose经典教程
* https://juejin.im/post/5b6f0039e51d45662d00d935
* https://blog.csdn.net/hjxzb/article/details/84927567


## docker 离线安装
* https://docs.docker.com/install/linux/docker-ce/binaries/
* https://blog.csdn.net/u013058742/article/details/80075633

## docker 迁移


## docker镜像加速 https://yeasy.gitbooks.io/docker_practice/install/mirror.html
{
  "registry-mirrors": [
      "http://hub-mirror.c.163.com",
       "https://dockerhub.azk8s.cn",
       "https://reg-mirror.qiniu.com"
    ]
}



yum install java
yum install maven

## 安装java开发工具包
* yum install java-devel


# cd /etc/yum.repo.d/
# curl -o epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo
# yum install -y python36 python36-setuptools
# easy_install-3.6 pip

# alternatives --install /usr/bin/python python /usr/bin/python2.7 1
# alternatives --install /usr/bin/python python /usr/bin/python3.6 2

# mv /usr/bin/pip /usr/bin/pip.bak    //原有的pip不是软连接，先把它干掉
# alternatives --install /usr/bin/pip pip /usr/bin/pip2.7 1
# alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.6 2

# alternatives --display python
# alternatives --config python

curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
yum install nodejs

# https://www.runoob.com/docker/centos-docker-install.html
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum -y install docker-ce
sudo systemctl start docker


# https://qizhanming.com/blog/2018/08/06/how-to-install-nginx-on-centos-7
yum install nginx
systemctl enable nginx
systemctl start nginx
systemctl restart nginx
systemctl reload nginx




后续yum问题
当切换成Python3以后发现yum命令不能用了,一执行就会报错:

# yum
  File "/usr/bin/yum", line 30
    except KeyboardInterrupt, e:
                            ^
SyntaxError: invalid syntax
这是因为系统yum命令使用的还需要使用Python2,分别修改/usr/libexec/urlgrabber-ext-down和/usr/bin/yum文件

# vi /usr/libexec/urlgrabber-ext-down
# vi /usr/bin/yum
首行的#! /usr/bin/python
都改为#! /usr/bin/python2.7
--------------------- 


mvn clean
mvn package docker:build


## 安装redis客户端
* yum install -y gcc wget
cd /tmp
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable

make
#make MALLOC=libc

cp src/redis-cli /usr/bin/

## redis 连接操作
* redis-cli -h 127.0.0.1 -p 6379
* auth 密码
* keys  select 0  exists key

### mongodb安装教程
* https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/
* https://juejin.im/post/5cbe73f86fb9a0320b40d687


### mongodb docker
db-mongo:
  image: mongo:3.6-jessie
  container_name: db-mongo
  networks:
    - _network name_
  volumes:
    - ./db-notes-mongo:/data/db
    - ./mongod.conf:/etc/mongod.conf
  command: mongod --config /etc/mongod.conf

db-mongo-admin:
    image: mongo-express
    container_name: db-mongo-admin
    networks:
        - _network name_
    environment:
        ME_CONFIG_OPTIONS_EDITORTHEME: ambiance
        ME_CONFIG_BASICAUTH_USERNAME: user
        ME_CONFIG_BASICAUTH_PASSWORD: fairlylongpassword
        ME_CONFIG_MONGODB_SERVER: some-mongo