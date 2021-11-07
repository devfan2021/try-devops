### 安装kubernetes环境

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
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
       http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF
```

* 关闭防火墙
```
systemctl stop firewalld && systemctl disable firewalld
```

* 关闭swap分区
```
swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
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
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables  # 修改当前内核状态
```

* centos7用户还需要设置路由
```
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system  # 重新加载所有配置文件
```

* 允许iptables检查桥接流量
```
cat <<EOF | sudo tee /etc/>modules-load.d/k8s.conf
br_netfilter
EOF 

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system  # 重新加载所有配置文件

```

#### 安装Docker

* 参考[08-centos-docker.md](./08-centos-docker.md)，版本为：20.10.7
```
yum install -y docker-ce-20.10.7 docker-ce-cli-20.10.7 containerd.io-1.4.6
```

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
yum install -y kubelet-1.20.9 kubeadm-1.20.9 kubectl-1.20.9 --disableexcludes=kubernetes
```

* 设置自启动服务
```
systemctl enable --now kubelet
systemctl enable kubelet.service
systemctl start kubelet
```

* kubelet命令补全
```
yum -y install bash-completion
echo "source <(kubectl completion bash)" >> ~/.bash_profile
source ~/.bash_profile
kubectl completion bash >/etc/bash_completion.d/kubectl
```

* 下载kubernetes相关组件的docker镜像
参考[k8s-pull-images.sh](./../k8s/k8s-pull-images.sh)
```
sudo tee ./images.sh <<-'EOF'
#!/bin/bash
images=(
  kube-apiserver:v1.20.9
  kube-proxy:v1.20.9
  kube-controller-manager:v1.20.9
  kube-scheduler:v1.20.9
  coredns:1.7.0
  etcd:3.4.13-0
  pause:3.2
)
for imageName in ${images[@]}; do
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
done
EOF

chmod +x ./images.sh && ./images.sh
```

* 所有机器添加master域名映射
```
echo "192.168.1.11 cluster-endpoint" >> /etc/hosts
```

* 使用kubeadm部署kubernetes集群master节点
```
kubeadm init \
--apiserver-advertise-address=192.168.1.11 \
--control-plane-endpoint=cluster-endpoint \
--image-repository registry.cn-hangzhou.aliyuncs.com/google_containers \
--kubernetes-version v1.20.9 \
--service-cidr=10.96.0.0/16 \
--pod-network-cidr=172.31.0.0/16
```

执行成功后，执行以下语句拷贝相关配置文件
```
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
```

* 健康状态检查
```
kubectl get cs      # 查看主要组件的健康状态
kubectl get nodes   # 查看master节点状态
```

* 部署网络插件calico
```
curl https://docs.projectcalico.org/manifests/calico.yaml -O

kubectl apply -f calico.yaml
```

* 部署网络插件weave
```
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
kubectl get pods -n kube-system -l name=weave-net -o wide  ## 查看Master节点上网络weave相关Pod的状态
```

* 创建新令牌
```
kubeadm token create --print-join-command
```