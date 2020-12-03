### 镜像
* 替换成阿里镜像
```
cd /etc/yum.repo.d/
curl -o epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo
```

### 安装开发环境
* 开发工具包
```
yum groupinstall "Development Tools"
yum install -y gcc g++ kernel-devel  
```
* OpenJDK
```
yum install java-1.8.0-openjdk-devel
```