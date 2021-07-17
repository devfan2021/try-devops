### 安装教程
* [click docker hub image](https://hub.docker.com/r/yandex/clickhouse-server/)
### host system volume for the data storage
* docker run -d --name xrksudy-clickhouse-server --ulimit nofile=262144:262144 --volume=/data/clickhouse-data:/var/lib/clickhouse yandex/clickhouse-server 
* Container exposes 8123 port for HTTP interface and 9000 port for native client.
* [Example Datasets](https://clickhouse.tech/docs/en/getting-started/example-datasets/)
* [ClickHouse JDBC](https://github.com/ClickHouse/clickhouse-jdbc)
* [ClickHouse http proxy and load balancer](https://golangrepo.com/repo/Vertamedia-chproxy-go-database-tools)
* [clickhouse实战之jdbc接入](https://xiaoyue26.github.io/2019/08/25/2019-08/clickhouse%E5%AE%9E%E6%88%98%E4%B9%8Bjdbc%E6%8E%A5%E5%85%A5/)
* [粗俗理解clickhouse](https://xiaoyue26.github.io/2019/07/06/2019-07/%E7%B2%97%E4%BF%97%E7%90%86%E8%A7%A3clickhouse/)


### 问题
* 官方ClickHouse-JDBC对连接池的支持？？
* 如果是java应用，推荐是直接采用Http请求方式还是官方的ClickHouse-JDBC请求
* clickhouse对分页的支持？
* 参考厂商的实现方式：http调用clickhouse请求，对查询结果进行缓存和熔断限流