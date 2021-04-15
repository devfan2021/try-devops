#!/bin/bash
# sed -i 's/${PROMETHEUS_TARGET_HOST}/xxxx/g' prometheus.yml
# sed -i 's/${COLLECT_YUN_HOST}/xxxx/g' prometheus.yml


# awk -v PROMETHEUS_TARGET_HOST=$PROMETHEUS_TARGET_HOST 'BEGIN{print PROMETHEUS_TARGET_HOST}' .env
#todo: 待处理任务，将.env里面的变量定义替换掉prometheus.yml中的敏感数据