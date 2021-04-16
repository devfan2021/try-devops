## https://community.grafana.com/t/solved-grafana-permission-denied-with-docker-on-centos7/12957
## https://grafana.com/docs/grafana/latest/installation/docker/#migrate-to-v51-or-later
rm -rf /data/devops-data/grafana
mkdir -p /data/devops-data/grafana
chown -R 472:1 /data/devops-data/grafana