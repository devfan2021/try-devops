## 以docker方式运行
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=7081:8080 \
  --detach=true \
  --name=cadvisor \
  google/cadvisor:latest

## 待处理问题
* Grafana的Docker and system monitoring面板上无法显示node主机ip信息