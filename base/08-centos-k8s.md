### 安装kubernetes环境

#### 安装基础环境

* 修改主机名
```
hostnamectl set-hostname kubernetes01
```

* 修改/etc/hosts文件
```
# kubernetes-cluster
10.5.0.206 kubernetes01
```

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

* 关闭防火墙
```
systemctl stop firewalld && systemctl disable firewalld
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
yum install -y bridge-utils.x86_64
modprobe br_netfilter # 加载br_netfilter模块，使用lsmod查看开启的模块
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
```

* centos7用户还需要设置路由
```
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system  # 重新加载所有配置文件
```

* 注释/etc/fstab中的UUID行
```
# UUID=b62d1910-e3e3-4425-9544-e7f467b7c7d4 /   ext4    defaults  1 1
```

#### 安装Docker

* 参考[08-centos-docker.md](./08-centos-docker.md)

#### 安装kubernetes

* 安装kubernetes相关软件
```
sudo yum install -y kubectl-1.19.4.-0 kubeadm-1.19.4-0 kubelet-1.19.4-0
```

* 设置自启动服务
```
systemctl enable kubelet.service
systemclt start kubelet
```

#### 调整cgroup-driver
* 设置docker-ce和kubernetes为同一个‘cgroup’
```
docker info | grep -i cgroup
sed -i 's/cgroup-driver=systemd/cgroup-driver=cgroupfs/g' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
```


ssh root@106.13.16.115

851027CBm!@#