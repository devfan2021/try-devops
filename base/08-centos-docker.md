### 安装kubernetes环境

#### 安装Docker

* 安装docker依赖
```
yum install -y yum-utils device-mapper-persistent-data lvm2
```

* 修改Docker镜像源
```
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum makecache fast
```

* 安装docker-ce
```
yum -y install docker-ce
```

* 修改Docker本地镜像与容器的存储位置
```
mv /var/lib/docker /mnt/docker-data
ln -s /mnt/docker-data /var/lib/docker
```

* 启动docker服务
```
systemctl start docker
service docker stop

systemctl daemon-reload
systemctl restart docker
```

#### 安装docker-compose

* 安装docker-compose
```
DOCKER_COMPOSE_VERSION=1.18.0
curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose
chmod +x docker-compose
sudo mv docker-compose /usr/local/bin
docker-compose --version
```