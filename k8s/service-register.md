K8S 在微服务架构下做服务注册中心的一种思路

使用 K8S 的 Service 和 DNS:

每个微服务都在K8S中创建一个 Service, 名起名比如: user.xingren.host ,
然后,其他微服务只需要 配置好这个K8s中的Service name 即可,
最后,只要这些微服务服务都在一个k8S集群中运行,便可省去注册中心与服务发现的这些微服务组件

这种方案,在我们公司已经落地,并且运行稳定. 从技术上来看, 比 Eureka 和 Nacos 这种请求穿透的 注册中心要高效的多, 因为 K8s 的服务发现和负载均衡是通过 iptables 和 内部的 DNS 来实现的
原文链接：https://blog.csdn.net/itguangit/article/details/109731971


微服务下的注册中心如何选择
https://www.cnblogs.com/wtzbk/p/14071040.html

Dubbo 在 K8s 下的思考
http://blog.itpub.net/31555606/viewspace-2661847/


https://www.cnblogs.com/wtzbk/p/15505814.html