## docker network
frontend、backend 是需要手动创建的自定义network (例如：docker network create frontend)

这样就可以在compose文件中声明并使用了


### docker compose
$ sudo curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
$ curl -L https://raw.githubusercontent.com/docker/compose/1.8.0/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose



$ DOCKER_COMPOSE_VERSION=1.18.0
$ curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose
$ chmod +x docker-compose
$ sudo mv docker-compose /usr/local/bin
$ docker-compose --version


## docker compose经典教程
* https://juejin.im/post/5b6f0039e51d45662d00d935
* https://blog.csdn.net/hjxzb/article/details/84927567


## docker 离线安装
* https://docs.docker.com/install/linux/docker-ce/binaries/
* https://blog.csdn.net/u013058742/article/details/80075633

## docker 潜移


## docker镜像加速 https://yeasy.gitbooks.io/docker_practice/install/mirror.html
{
  "registry-mirrors": [
      "http://hub-mirror.c.163.com",
       "https://dockerhub.azk8s.cn",
       "https://reg-mirror.qiniu.com"
    ]
}

$ sudo systemctl daemon-reload
$ sudo systemctl restart docker