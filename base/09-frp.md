### [Centos安装frpc开机自启动设置方法](https://blog.csdn.net/xtjatswc/article/details/108861010)

```
将frpc和frpc.ini文件拷贝到对应目录，设置执行权限
$ sudo cp frpc /usr/bin/frpc
$ sudo chmod -R 777 /usr/bin/frpc
$ sudo mkdir /etc/frp
$ sudo cp frpc.ini /etc/frp/frpc.ini
$ sudo cp systemd/frpc.service /lib/systemd/system/frpc.service

#刷新服务列表：
systemctl daemon-reload

#设置开机自启
systemctl enable frpc
#关闭开机自启
systemctl disable frpc

#启动服务
systemctl start frpc
#停止服务
systemctl stop frpc
#查看服务状态
systemctl status frpc
```
