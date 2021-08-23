#### 安装Docker

* 安装docker依赖
```
yum install -y yum-utils device-mapper-persistent-data lvm2
```

* 修改Docker镜像源
```
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum -y makecache
```

* 安装docker-ce
```
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
yum install -y docker-ce
```

* 修改Docker本地镜像与容器的存储位置
```
mv /var/lib/docker /data/docker-data
ln -s /data/docker-data /var/lib/docker
```

* 启动docker服务
```
systemctl start docker
systemctl stop docker

systemctl daemon-reload
systemctl restart docker
```

#### 安装docker-compose

* 安装docker-compose
```
DOCKER_COMPOSE_VERSION=1.29.2
curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > docker-compose
chmod +x docker-compose
mv docker-compose /usr/local/bin
docker-compose --version
```

#### 设置自启动服务
```
systemctl enable docker.service
systemctl start docker
```

#### 配置镜像加速器
```
mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://uz2y6kfd.mirror.aliyuncs.com"]
}
EOF
systemctl daemon-reload
systemctl restart docker
```