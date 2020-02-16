* 看到网上很多文章说的 client 节点通常指的是 ingest 节点还是 coordinate 节点？有点矛盾：

1. 从很多文章看 client 节点是 node.master 和 node.data 为 false，这样的配置判断看应该是 only ingest 节点
2. 从文章分析说 client 节点用来做负载均衡，路由请求，分发索引，处理搜索，这样判断听起来又像是 coordinate 节点

比较困扰，期待回复，多谢

>>> 作者回复: client 节点是老版本中的概念。 Ingest Node和Coordinate 节点是后来引入的节点类型。
>>> 
>>> 简单说，Ingest用来说数据写入后的抽取和处理，Coordinate负责接受 Rest API，并分发到合适的节点。
>>> 
>>> 你可以设置 dedicate的 Ingest Node 和 Coordinate node，也可以将节点设置成 Ingest Node + Coordinate Node，你可以可以把这样的节点叫Client 节点。

* ingest node 和 coordinating node 具体是什么区别？

>>> 作者回复: 在后续章节会对此详解解释。
>>>
>>> 1）Coordinating Node - 当节点接受到 REST API 请求的时候。节点就会承担 Coordiating Node 的角色，负责将请求分发到其他的节点。最终将结果汇总，返回 response
>>>
>>> 2）Ingest Node，可以用来承担一些数据管道的数据转换工作，例如，为你的文档增加一个新的字段，例如帮转换文档中的字段。Ingest node 和 pipleine 在第二部分有具体的介绍

* 老师你好，over-sahrding是啥意思呢？然后就是7.x开始，主分片数目默认为1，那会不会一旦数据量大了就得reindex了呢？
  
>>> 作者回复: overshard指的是过度的使用sharding。过分分片会带来一些问题。例如你数据量很少，用了多个分片。tf-idf算分会产生不准的情况。因为es会在每个分片上计算。而idf是一个全局的指标，数据量过少，算得肯定不对。
>>>
>>>这些在后续课程中会有覆盖。简单说，数据量不大，例如几百万，用一个主分片就可以了。早期版本，默认使用5个显然是多多了