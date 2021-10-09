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

### frp服务器端
[common]
bind_port = 6000
dashboard_port = 6500
auth_token = 12345678
dashboard_user = xrksudy
dashboard_pwd = 396498141CBm
vhost_http_port = 10080
vhost_https_port = 10443
subdomain_host = devfan.site

[portainer]
type = http
auth_token = 12345678
subdomain = portainer

[kubesphere]
type = http
auth_token = 12345678
subdomain = kubesphere

[ssh]
type = tcp
listen_port = 6050
auth_token = 12345678


### frp客户端
[common]
server_addr = 106.13.16.115
server_port = 6000

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6050

[portainer]
type = http
local_port = 9000
subdomain = portainer

[kubesphere]
type = http
local_port = 30880
subdomain = kubesphere


## 加入开机启动项
* /lib/systemd/system/frps.service

[Unit]
Description=frpc client
After=network.target syslog.target
Wants=network.target

[Service]
Type=simple
ExecStart=/root/frp_0.37.1/frpc -c /root/frp_0.37.1/frpc.ini
Restart= always
RestartSec=1min
ExecStop=/usr/bin/killall frpc

[Install]
WantedBy=multi-user.target

## 查找启动异常
journalctl -u frpc