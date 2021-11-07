# 安装KubeSphere前置环境
## nfs文件系统
1、安装nfs-server
```
# 在每台机器上执行
yum install -y nfs-utils

# 在master上执行
echo "/nfs/data/ *(insecure,rw,sync,no_root_squash)" > /etc/exports

# 执行以下命令，启动nfs服务，创建共享目录
mkdir -p /nfs/data

# 在master上执行
systemctl enable rpcbind
systemctl enable nfs-server
systemctl start rpcbind
systemctl start nfs-server

# 使配置生效
exportfs -r

# 检查配置是否生效
exportfs
```

2、配置nfs-client（选做）
```
showmount -e 192.168.1.11
mkdir -p /nfs/data
mount -t nfs 192.168.1.11:/nfs/data /nfs/data
```


## KubeSphere Enable Pluggable Components

### KubeSphere App Store
* openpitrix: true
* kubectl get pod -n openpitrix-system

### KubeSphere Logging System
* logging: true
* kubectl get pod -n kubesphere-logging-system

### KubeSphere Service Mesh
* servicemesh: true
* kubectl get pod -n istio-system



### Issue
* how to install Grafana, Prometheus
