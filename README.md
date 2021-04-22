## 待处理问题
* 根目录下写一个脚本，统一管理各docker容器服务，避免启动所有服务，占用机器资源
* 监控monitor下的prometheus下config，新增一个脚本，将.evn敏感信息写入prometheus.yml里


## 日志

### 2021-04-20
* 采用docker部署mysql
* 增加sofa-register官方部署包

### 2021-04-16
* 解决Grafana部署问题
* 增加待处理问题列表
* 加入开源的Grafana Dashboard

### 2021-04-15
* Prometheus部署
* 增加采集主机的node-exporter
* 增加采集redis的exporter

### 2021-04-14
* 增加SonarQube部署相关配置
* 与GitLab CI进行集成

### 2021-04-11
* 调整redis目录
* 采用docker run方式部署redis单实例

### 2021-04-10
* 调整DB文件目录

### 2021-04-08
* 增加gitlab-runner容器化部署
* 采用gitlab CI/CD自定义跑通sample

### 2021-04-07
* 清理部分无效重复脚本
* 更新配置文件
* 修复nexus安装自定义存储路径问题

### 2021-04-06
* 加入nexus进行制品库的管理
* 调整docker/ci目录下的jenkins命名

### 2021-04-01
* 迁移项目到devfan2021
* 调整项目为try-devops
* 将配置参数单独放到.env文件里，避免安全问题

### 2021-03-31
* 增加docker相关命令
* 增加删除kubesphere的命令脚本
* 增加删除k8s的相关命令

### 2020-12-09
* 更新Docker安装脚本

### 2020-12-08
* 增加k8s命令文件
* 更新文件格式

### 2020-12-05
* 调整文件名称
* k8s安装步骤更新

### 2020-12-04
* 重新调整目录结构
* 针对centos单独组织各个安装文件
* 更新centos主机下相关命令

### 2020-12-03
* 增加base目录，专门存储Linux基础环境安装
* 增加centos系统下基础软件安装
* 增加centos系统下docker安装

### 2019-10-06
* 采用docker方式运行logstash
* 增加es学习实例目录
* es的cat的api查询方法

### 2019-10-01
* 初始化项目
* 分类目录
* 增加glance监控