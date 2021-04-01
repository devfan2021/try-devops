## minikube命令汇总
```
minikube version
minikube start
minikube status               ## 查看状态
minikube service list         ## 查看服务列表

minikube service hello-node   ## 启动服务
```

```
minikube docker-env           ## minikube 虚拟机的 docker 环境变量
```

## kubernetes命令汇总
```
kubectl version
kubectl cluster-info   ## 查看集群是否正常工作
kubectl get nodes

kubectl create deployment hello-node --image=gcr.io/hello-minikube-zero-install/hello-node  ## 创建一次部署，用于管理pod
kubectl get deployments  ## 查看部署
kubectl get pods         ## 查看pod
kubectl get events       ## 查看集群事件
kubectl config view      ## 查看kubectl配置

kubectl expose deployment hello-node --type=LoadBalancer --port=8080   ## 将pod暴露到公网
kubectl get services     ## 查看服务
kubectl describe services/hello-node   ## 查看服务对外暴露的端口
kubectl describe deployment  ## 查看服务标签

## 通过标签查询pod列表和服务列表
kubectl get pods -l app=hello-node
kubectl get services -l app=hello-node
```

### kubectl get - 列出资源
```
kubectl get pods                       ## 查看所有pod列表
kubectl get pods --all-namespaces      ## 查看所有pod列表
kubectl get rc                         ## 查看rc列表
kubectl get services                   ## 查看service列表
kubectl get node -o wide               ## 集群节点信息
kubectl api-resources                  ## 查询资源类型
```

### kubectl describe - 显示资源详情
```
kubectl describe nodes [node名]        ## 显示node的详细信息
kubectl describe pods/[pod名]          ## 显示pod的详细信息
kubectl describe pods [rc名]           ## 显示由RC管理的pod的信息
```

### kubectl exec - 向pod中的容器执行命令
```
kubectl exec <pod名> date                        ## 执行pod的date命令，默认使用pod中的第1个容器执行
kubectl exec <pod名> -c <容器名> date             ## 指定pod中某个容器执行date命令
kubectl exec -it <pod名> -c <容器名>  /bin/bash   ## #登录容器执行命令
```

### kubectl logs - 打印pod中的容器的日志
```
kubectl logs <pod名>                   ## 查看容器输出到stdout的日志
kubectl logs -f <pod名> -c <容器名>     ## 跟踪查看容器的日志，相当于tail -f命令的结果
```

## 开启Kubernetes dashboard
```
minikube dashboard
```

## 服务实例命令
```
kubectl create deployment hello-minikube --image=registry.cn-hangzhou.aliyuncs.com/google_containers/echoserver:1.14  ## 创建部署
kubectl expose deployment hello-minikube --type=NodePort --port=8080                                                  ## 将部署暴露为服务
kubectl get pod                                                                                                       ## 查看服务
minikube service hello-minikube --url                                                                                 ## 获取服务URL
kubectl delete services hello-minikube                                                                                ## 删除服务
kubectl delete deployment hello-minikube                                                                              ## 删除部署
minikube stop                                                                                                         ## 停止Minikube集群
minikube delete                                                                                                       ## 删除Minikube集群
minikube dashboard                                                                                                    ## 查看仪表盘
```

## kubectl命令解释
```
kubectl [command] [TYPE] [NAME] [flags]
```
* Where command, TYPE, NAME, and flags are:
> * command: Specifies the operation that you want to perform on one or more resources, such as create, get, describe and delete.
> * TYPE: Specifies the [resource type](https://kubernetes.io/docs/reference/kubectl/overview/#resource-types). Resource types are case-insensitive and you can specify the singular, plural, or abbreviated forms.
> * NAME: Specifies the name of the resource. Names are case-sensitive. If the name is omitted, details for all resources are displayed, such as kubectl get pods.
> * flags: Specifies optional flags. For example, you can use the -s or --server flags to specify the address and port of the Kubernetes API server.
* If you need help, run kubectl help from the terminal window or refer to the Kubernetes kubectl CLI documentation.

## K8S卸载
**kubeadm reset**  重置
**rm -rf `$HOME/.kube`**  删除文件


## 常用命令

### 检查核心组件（例如etcd服务）的状态，并确保一切就绪
```
kubectl get nodes -l node-role.kubernetes.io/master
```

### 检查所有工作节点的状态
```
kubectl get nodes -l node-role.kubernetes.io/worker
```