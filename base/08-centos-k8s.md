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
gpgcheck=1
repo_gpgcheck=1
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

#### 安装Docker

* 参考[08-centos-docker.md](./08-centos-docker.md)

#### 安装kubernetes

#### 调整cgroup-driver
* 设置docker-ce和kubernetes为同一个‘cgroup’
修改daemon.json，新增‘"exec-opts": ["native.cgroupdriver=systemd"’
```
[root@master ~]# more /etc/docker/daemon.json 
{
  "registry-mirrors": ["https://v16stybc.mirror.aliyuncs.com"],
  "exec-opts": ["native.cgroupdriver=systemd"]
}
```

* 安装kubernetes相关软件
```
sudo yum install -y kubectl-1.19.4.-0 kubeadm-1.19.4-0 kubelet-1.19.4-0
```

* 下载kubernetes相关组件的docker镜像
```
```

* 设置自启动服务
```
systemctl enable kubelet.service
systemclt start kubelet
```

* kubelet命令补全
```
echo "source <(kubectl completion bash)" >> ~/.bash_profile
source ~/.bash_profile
```

* 下载kubernetes相关组件的docker镜像
参考[k8s-pull-images.sh](./../k8s/k8s-pull-images.sh)

* 使用kubeadm部署kubernetes集群master节点
```
kubeadm init --kubernetes-version=v1.19.4
```

执行成功后，执行以下语句拷贝相关配置文件
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

* 健康状态检查
```
kubectl get cs      # 查看主要组件的健康状态
kubectl get nodes   # 查看master节点状态
```

* 部署网络插件weave
```
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
kubectl get pods -n kube-system -l name=weave-net -o wide  ## 查看Master节点上网络weave相关Pod的状态
```