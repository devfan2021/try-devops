## 源码安装
* 检查版本匹配关系 [RabbitMQ Erlang Version Requirements](https://www.rabbitmq.com/which-erlang.html)
* 下载rabbitmq-server-generic-unix-3.9.11.tar.xz和otp_src_24.2.tar.gz到/usr/local/devops目录下
* 安装依赖: yum -y install gcc glibc-devel make ncurses-devel openssl-devel xmlto perl wget gtk2-devel binutils-devel
* 解决 ODBC library – link check failed： yum install unixODBC unixODBC-devel
* tar -zxvf otp_src_24.2.tar.gz
* mkdir /usr/local/devops/erlang
* cd /usr/local/devops/otp_src_24.2
* 执行编译：./configure --prefix=/usr/local/devops/erlang 
* 执行编译：make && make install
* 增加软连接： ln -s /usr/local/devops/erlang/bin/erl /usr/local/bin/erl
* yum install -y xz
* xz -d rabbitmq-server-generic-unix-3.9.11.tar.xz
* tar -xvf rabbitmq-server-generic-unix-3.9.11.tar
* 增加软连接：ln -sv rabbitmq_server-3.9.11 rabbitmq
* RabbitMQ环境变量：echo 'export PATH=$PATH:/usr/local/devops/rabbitmq/sbin' >> /etc/profile
* 生效环境变量：source /etc/profile
* 启动服务：rabbitmq-server -detached
* 服务状态：rabbitmqctl status
* 开启管理界面： rabbitmq-plugins enable rabbitmq_management
* 登录web管理界面： http://x.x.x.x:15672

## RabbitMQ常用几个命令
* 启动服务：rabbitmq-server -detached
* 服务状态：rabbitmqctl status
* 停止服务：rabbitmqctl stop
* 查看所有用户：rabbitmqctl list_users
* 添加用户：rabbitmqctl add_user username password
* 配置权限(所有host的所有操作)：rabbitmqctl set_permissions -p "/" username ".*" ".*" ".*"
* 查看权限：rabbitmqctl list_user_permissions username
* 设置用户tags（相当于角色，包含administrator，monitoring，policymaker，management）: rabbitmqctl set_user_tags username administrator
* 删除用户： rabbitmqctl delete_user username
* 修改用户密码：rabbitmqctl change_password username password

## 参考
* [CentOS 7 安装 RabbitMQ](https://segmentfault.com/a/1190000021637190)