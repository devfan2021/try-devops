### 待处理问题
* mysqld_exporter开启日志debug模式， 会有以下错误。level=debug ts=2021-12-21T15:57:42.487Z caller=info_schema_query_response_time.go:126 scraper=info_schema.query_response_time msg="Query response time distribution is not available."
* prometheus数据的持久化----默认缓存15天？
* prometheus基于注册中心，监控不同节点服务？
* prometheus高可用部署？
* 单机prometheus的处理能力？
* 大规服务节点需要监控时，如何部署prometheus节点分摊单节点prometheus的处理能力

## redis监控是监控主节点还是哨兵节点
* [Prometheus监控 Redis & Redis Cluster](https://www.cnblogs.com/zhoujinyi/p/12189239.html) 不错的思路，节点单独配置文件

## 参考资料
* [prometheus相关 离线安装](https://blog.csdn.net/qq_36208812/article/details/103513349)
* [腾讯云 Prometheus 监控服务](https://cloud.tencent.com/document/product/1416)
* [Prometheus基于consul中心自动发现注册监控](https://python.iitter.com/other/10216.html)