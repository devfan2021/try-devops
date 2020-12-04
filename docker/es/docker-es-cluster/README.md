
# 查询状态
* curl -XGET 'http://127.0.0.1:9008/_cluster/health?pretty'
* curl -XGET 'http://xxx.xxx.xxx.xxx:9008/_cluster/health?pretty'
* https://abcops.cn/elasticsearch-curl/

## 问题

[1]: max file descriptors [65535] for elasticsearch process is too low, increase to at least [65536]

编辑 /etc/security/limits.conf，追加以下内容；
* soft nofile 65536
* hard nofile 65536
此文件修改后需要重新登录用户，才会生效


[2]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]

编辑 /etc/sysctl.conf，追加以下内容：
vm.max_map_count=655360
保存后，执行：
sysctl -p


* kibana 反向代理
* https://discuss.elastic.co/t/how-to-update-kibana-dashboard-url-from-app-kibana-to-kibana-app-kibana/163798/3
* https://discuss.elastic.co/t/kibana-behind-nginx-discover-not-found/60899/3
* https://discuss.elastic.co/t/nginx-reverse-proxy-setup-for-kibana/167327
* https://stackoverflow.com/questions/31463374/kibana-dashboard-couldnt-connect-with-nginx

## head连接集群
* xrksudy集群： https://xrksudy-discover-stg.jryzt.com/es-master/