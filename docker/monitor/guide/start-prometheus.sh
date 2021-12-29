#!/bin/bash

pid=`ps -ef | grep prometheus | grep -v start-prometheus | grep -v grep | awk '{print $2}'`
if [ x"$pid" != x"" ]; then
  echo "begin kill prometheus"
  kill -9 $pid
  echo "finish kill prometheus"
fi

echo "bein start..."
nohup /usr/local/devops/prometheus/prometheus --config.file=/usr/local/devops/prometheus-files.yml --web.listen-address=:4090 --storage.tsdb.path=/data/devops-data/prometheus > logs/prometheus.out 2>&1 &
echo "finish start..."