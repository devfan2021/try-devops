## 采用Docker方式部署
* https://github.com/steventong/sofa-registry-docker

## 问题列表
* [服务端部署注册中心(SOFARegistry)时，会出现9622端口打开成功，但是检查失败](https://github.com/sofastack/sofa-registry/issues/156)


## 健康检查
* 查看meta角色的健康检测接口：http://localhost:9615/health/check
* 查看data角色的健康检测接口：http://localhost:9622/health/check
* 查看session角色的健康检测接口：http://localhost:9603/health/check