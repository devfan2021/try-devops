### 镜像

* 替换成阿里镜像
```
cd /etc/yum.repo.d/
curl -o epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo
```

### 环境安装命令

* 安装软件
```
yum install -y docker-ce
```

* 列出已安装的软件包
```
yum list installed | grep docker
```

* 卸载软件
```
yum remove xxx
```

### 安装开发环境

* 命令补全工具
```
yum install -y bash-completion
source /etc/profile.d/bash_completion.sh
```

* 开发工具包
```
yum groupinstall "Development Tools"
yum install -y gcc g++ kernel-devel  
```

* Java环境
```
yum install java   ### 安装的是OpenJDK
yum install maven
```

* 安装git
```
yum install git
```

* 更新缓存
```
yum clean all
yum -y makecache
```

### 基础运维

* 查看开机启动项
```
systemctl list-unit-files | grep enable
```

* 为服务添加开机启动项
```
systemctl enable docker.service
```

* 移除开机启动项的服务
```
systemctl disable docker.service
```

* 刷新systemd
```
systemctl daemon-reload
systemctl reset-failed
```

* 查看服务状态，异常信息等
```
systemctl status docker
journalctl -ex
```