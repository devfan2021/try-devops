## 操作步骤
### 默认端口调整说明
* prometheus: 9090->4090
* grafana: 3000->4000
* node_exporter: 9100->4001
* loki: 3100->4100(http), 9096->4096(grpc)，alertmanager_url: 9093->4093
* promtail: 9080->4080(http)

### 安装prometheus
* cd /usr/local/devops
* tar -xvf /data/devops/prometheus/prometheus-2.31.1.linux-amd64.tar.gz -C /usr/local/devops
* ln -sv /usr/local/devops/prometheus-2.31.1.linux-amd64/ /usr/local/devops/prometheus
* 上传prometheus.yml到/usr/local/devops目录下
* mkdir -p /data/devops-data/prometheus
* 后台启动：nohup /usr/local/devops/prometheus/prometheus --config.file=/usr/local/devops/prometheus.yml --web.listen-address=:4090 --storage.tsdb.path=/data/devops-data/prometheus &

### 安装alertmanager
* cd /usr/local/devops
* tar -zxvf /data/devops/prometheus/alertmanager-0.23.0.linux-amd64.tar.gz -C -C /usr/local/devops
* ln -sv alertmanager-0.23.0.linux-amd64/ alertmanager
* 

### 安装grafana
* cd /usr/local/devops
* tar -xvf /data/devops/grafana/grafana-8.2.2.linux-amd64.tar.gz -C /usr/local/devops/
* ln -sv grafana-8.2.2/ grafana
* mkdir -p /data/devops-data/grafana
* 修改/usr/local/devops/grafana/conf/defaults.ini的默认端口为4000， 默认存储路径为：/data/devops-data/grafana
* 进入/usr/local/grafana, 执行命令： nohup ./bin/grafana-server web &

### 安装node_exporter
* cd /usr/local/devops
* tar -zxvf /data/devops/prometheus/node_exporter-1.2.2.linux-amd64.tar.gz -C /usr/local/devops
* ln -sv node_exporter-1.2.2.linux-amd64/ node_exporter
* nohup /usr/local/devops/node_exporter/node_exporter --web.listen-address=:4001 &

### 安装loki
* cd /usr/local/devops
* unzip /data/devops/grafana/loki-linux-amd64.zip
* ln -sv loki-linux-amd64 loki
* nohup /usr/local/devops/loki -config.file=/usr/local/devops/loki-local-config.yaml &

### 安装promtail
* cd /usr/local/devops
* unzip /data/devops/grafana/promtail-linux-amd64.zip
* ln -sv promtail-linux-amd64 loki-promtail
* nohup /usr/local/devops/loki-promtail -config.file=/usr/local/devops/promtail-local-config.yaml &

## 参考资料
* [prometheus相关 离线安装](https://blog.csdn.net/qq_36208812/article/details/103513349)