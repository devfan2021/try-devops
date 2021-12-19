## 操作步骤
### 默认端口调整说明
* prometheus: 9090->4090
* grafana: 3000->4000
* node_exporter: 9100->4001
* loki: 3100->4100(http), 9096->4096(grpc)，alertmanager_url: 9093->4093
* promtail: 9080->4080(http)
* mysqld_exporter: 9104

### 安装prometheus
* cd /usr/local/devops
* tar -xvf /data/devops/prometheus/prometheus-2.31.1.linux-amd64.tar.gz -C /usr/local/devops
* ln -sv /usr/local/devops/prometheus-2.31.1.linux-amd64/ /usr/local/devops/prometheus
* 上传prometheus.yml到/usr/local/devops目录下
* mkdir -p /data/devops-data/prometheus
* 后台启动：nohup /usr/local/devops/prometheus/prometheus --config.file=/usr/local/devops/prometheus.yml --web.listen-address=:4090 --storage.tsdb.path=/data/devops-data/prometheus &
* nohup /usr/local/devops/prometheus/prometheus --config.file=/usr/local/devops/prometheus.yml --web.listen-address=:4090 --storage.tsdb.path=/data/devops-data/prometheus > logs/prometheus.out 2>&1 &

### 安装grafana
* cd /usr/local/devops
* tar -xvf /data/devops/grafana/grafana-8.2.2.linux-amd64.tar.gz -C /usr/local/devops/
* ln -sv grafana-8.2.2/ grafana
* mkdir -p /data/devops-data/grafana
* 修改/usr/local/devops/grafana/conf/defaults.ini的默认端口为4000， 默认存储路径为：/data/devops-data/grafana
* 进入/usr/local/grafana, 执行命令： nohup ./bin/grafana-server web &
* 或者指定path路径： nohup ./bin/grafana-server --homepath /data/devops-data/grafana --config /usr/local/devops/grafana/conf/defaults.ini &
* 另外一个安装：grafana-server --homepath=/usr/share/grafana --config=/etc/grafana/grafana.ini --packaging=docker cfg:default.log.mode=console cfg:default.paths.data=/var/lib/grafana cfg:default.paths.logs=/var/log/grafana cfg:default.paths.plugins=/var/lib/grafana/plugins cfg:default.paths.provisioning=/etc/grafana/provisioning

### 安装node_exporter
* cd /usr/local/devops
* tar -zxvf /data/devops/prometheus/node_exporter-1.2.2.linux-amd64.tar.gz -C /usr/local/devops
* ln -sv node_exporter-1.2.2.linux-amd64/ node_exporter
* nohup /usr/local/devops/node_exporter/node_exporter --web.listen-address=:4001 &

### 安装loki
* cd /usr/local/devops
* unzip /data/devops/grafana/loki-linux-amd64.zip
* ln -sv loki-linux-amd64 loki
* nohup /usr/local/devops/loki -config.file=/usr/local/devops/loki-local-config.yml > logs/loki.out 2>&1 &

### 安装promtail
* cd /usr/local/devops
* unzip /data/devops/grafana/promtail-linux-amd64.zip
* ln -sv promtail-linux-amd64 loki-promtail
* nohup /usr/local/devops/loki-promtail -config.file=/usr/local/devops/promtail-local-config.yml > logs/promtail.out 2>&1 &

### 安装mysqld_exporter
* cd /usr/local/devops
* tar -zxvf mysqld_exporter-0.13.0.linux-amd64.tar.gz
* ln -sv mysqld_exporter-0.13.0.linux-amd64 mysqld_exporter
* 在mysql库里新增一个专门用于采集的用户，并赋权查询等权限
* create user 'exporter'@'localhost'  IDENTIFIED BY 'eXpIHB666QWE!!' WITH MAX_USER_CONNECTIONS 3;
* alter user 'exporter'@'localhost'  IDENTIFIED BY 'eXpIHB666QWE!!';
* GRANT SELECT, PROCESS, SUPER, REPLICATION CLIENT, RELOAD ON *.* TO 'exporter'@'localhost';
* FLUSH PRIVILEGES;
* nohup /usr/local/devops/mysqld_exporter/mysqld_exporter --config.my-cnf=/usr/local/devops/mysqld_exporter.cnf &
* nohup /usr/local/devops/mysqld_exporter/mysqld_exporter \
--config.my-cnf="/usr/local/devops/mysqld_exporter.cnf" \
--web.listen-address="0.0.0.0:9104" \
--log.level=debug \
> logs/mysqld_exporter.out 2>&1 &

### 安装alertmanager
* cd /usr/local/devops
* tar -zxvf /data/devops/prometheus/alertmanager-0.23.0.linux-amd64.tar.gz -C -C /usr/local/devops
* ln -sv alertmanager-0.23.0.linux-amd64/ alertmanager

## 面板模板
* node_exporter: 11074
* mysqld_exporter: 7362

## 参考资料
* [prometheus相关 离线安装](https://blog.csdn.net/qq_36208812/article/details/103513349)