## _cat indices API

### 查询节点
GET _cat/nodes

### 查询复制
GET _cat/shards

### 查看indices
GET /_cat/indices/movies?v&s=index

### 查看状态为绿的索引
GET /_cat/indices?v&health=green

### 按照文档个数排序
GET /_cat/indices?v&s=docs.count:desc

### 查看具体的字段
GET /_cat/indices/movies?pri&v&h=health,index,pri,rep,docs.count,mt

### 索引容量
GET /_cat/indices?v&h=i,tm&s=tm:desca