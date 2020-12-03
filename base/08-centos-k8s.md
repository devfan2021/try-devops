### 安装kubernetes环境

#### 安装基础环境
* 设置centos 可用的 kubernetes 国内软件源
```
cat <<EOF > kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
       http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
```

```
mv kubernetes.repo /etc/yum.repos.d
```

* 关闭swap分区
```
swapoff -a
```

* 禁用SELinux
```
setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
```

* 开启br_netfilter Kernel
```
modprobe br_netfilter
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
```

* centos7用户还需要设置路由
```
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
```

* 注释/etc/fstab中的UUID行
```
# UUID=b62d1910-e3e3-4425-9544-e7f467b7c7d4 /   ext4    defaults  1 1
```

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

#### 安装kubernetes

* 安装kubernetes相关软件
```
sudo yum install -y kubectl-1.19.4.-0 kubeadm-1.19.4-0 kubelet-1.19.4-0
```



* 启动服务
```
systemctl enable docker.service
systemctl enable kubelet.service
```

* 设置自启动
```
systemctl enable kubelet && systemctl start kubelet
```
