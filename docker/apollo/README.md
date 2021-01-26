## 使用Docker部署Apollo

### 一、单环境的安装

#### 1、下载Apollo源码
```
git clone https://github.com/ctripcorp/apollo.git
```

#### 2、进入docker-quick-start目录
```
cd apollo/scripts/docker-quick-start
```

#### 3、安装启动
```
docker-compose up
docker-compmse up -d  ## 后台运行
```

#### 4、基本使用

后台管理：http://localhost:8070,  账号密码：apollo/admin
数据库Mysql: localhost:13306, 用户名：root，密码为空

[参考资料](https://blog.raikay.com/post/2020/apollo/)