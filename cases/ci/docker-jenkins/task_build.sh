#!/bin/bash
## 需要结合另外一个清理脚本，定期清理项目发布过程中的备份文件

project_name=demo

yarn config set registry https://registry.npm.taobao.org
yarn
yarn run build

rm -rf $project_name
rm -rf $project_name.tar
mv build $project_name
tar -zcf $project_name.tar $project_name
mv $project_name.tar /var/www/

if [ -d "/var/www/${project_name}" ]; then
	time=`date '+%Y%m%d%H%M%S'`
    mv /var/www/${project_name} /var/www/${project_name}_$time
fi

cd /var/www/
tar -xf $project_name.tar
rm -rf $project_name.tar





project_name=ycyh

#删除老的build文件
rm -rf dist

yarn config set registry https://registry.npm.taobao.org
yarn
yarn run build

cd dist/build
mv h5 $project_name
tar -zcf $project_name.tar $project_name
mv $project_name.tar /var/www/

if [ -d "/var/www/${project_name}" ]; then
	time=`date '+%Y%m%d%H%M%S'`
    mv /var/www/${project_name} /var/www/${project_name}_$time
fi

cd /var/www/
tar -xf $project_name.tar
rm -rf $project_name.tar