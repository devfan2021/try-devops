## 镜像说明
* http://mirrors.163.com/.help/centos.html

## 运行以下命令生成缓存
* yum clean all
* yum makecache




## MongoDB授权
use wiki_info_v2
db.createUser({user: "xrksudylab", pwd: "xrksudy-discover-!@", roles: [{ role: "readWrite", db: "xxx2qi"}]})
db.updateUser( "xrksudylab", {roles : [ { role : "readWrite", db : "wiki_info_v2"  }, { role : "readWrite", db : "xxx2qi"  } ]})

## import表
mongoimport --host 127.0.0.1:27017 -u xrksudylab -p 'xrksudy-discover-!@' --authenticationDatabase=admin --db=wiki_info_v2 --collection=amusement --file=/mnt/db_backup/amusement

## mongodb还原数据
* mongorestore -h xxx.xxx.xxx.xxx -u root -p 'xrksudy-discover-!@' -d wiki_info_v2  backup_path

## Java问题
* https://juejin.im/post/5d1d5e60f265da1b67212b20

## docker导入导出镜像
* docker save -o xrksudy.wiki-aggregation.tar xrksudy.wiki-aggregation:latest
* docker load --input xrksudy.wiki-aggregation.tar