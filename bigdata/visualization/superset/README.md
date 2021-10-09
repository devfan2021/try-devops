
## 资料汇集
* [官网](https://superset.apache.org/): Airbnb开源的基于python的数据分析与可视化平台
* [Docker file](https://hub.docker.com/r/apache/superset)


## 问题
* 在虚机上用Docker安装了下，需要再进行命令执行，创建用户等
* 初步尝试了下，功能相对比较复杂，但是需要了解报表相关的制作基础知识，比如度量，维表，group by等
* [Metabase](https://github.com/metabase/metabase)
* [阿里 Quick BI 数据可视化分析平台](https://www.aliyun.com/product/bigdata/bi?spm=5176.12825654.eofdhaal5.172.38612c4a1bJ1FS&aly_as=9I3RNoFa)



## 已确认的问题
* 蚂蚁云和阿里云上都可以连目前的Oracle数据，上生产时重新提交阿里云连Oracle的网络权限
* 阿里云对象存储也不支持外网访问
* 阿里云上动态配置和蚂蚁云上一致，不用做改造
* 迁移到阿里云后，整个网络链路与蚂蚁云类似，比如ALB，F5等

## 待确认的问题
* redis是标准方式创建的，确认是否是哨兵模式（陈百门）
* 放后管功能的nginx，如果迁移到阿里云nginx上，是否支持OA VPN进行访问这个，或者外部F5接到这个nginx上 (陈乐熙)
* 电话盒子功能的nas盘，是否需要迁移到阿里云上（张宇煜，陈乐熙）
* 生产迁移时，是不是申请的F5不用变，只需要调整F5转发规则？（陈乐熙）