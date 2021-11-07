
## [下载基本环境rpm包](https://blog.csdn.net/qq_36208812/article/details/103513349)
```
yum install yum-utils  #此工具用来下载需要的RPM包（就是将我们在线yum安装的东西只下载不安装）
yumdownloader lsof --resolve --destdir=/home/softpackage/ #--resolve 下载其依赖包
yumdownloader lrzsz --resolve --destdir=/home/softpackage/
yumdownloader telnet --resolve --destdir=/home/softpackage/
```

## [安装各组件](https://www.cnblogs.com/sunyllove/p/11214097.html)

## [redis_exporter](https://github.com/oliver006/redis_exporter)