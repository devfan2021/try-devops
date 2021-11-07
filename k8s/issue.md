### k8s安装，使用问题汇总

#### 安装篇

* [解决kubernetes:v1.18.6-1.19.0 get cs127.0.0.1 connection refused错误](https://blog.csdn.net/cymm_liu/article/details/108458197)



Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
[kubelet-check] Initial timeout of 40s passed.

        Unfortunately, an error has occurred:
                timed out waiting for the condition

        This error is likely caused by:
                - The kubelet is not running
                - The kubelet is unhealthy due to a misconfiguration of the node in some way (required cgroups disabled)

        If you are on a systemd-powered system, you can try to troubleshoot the error with the following commands:
                - 'systemctl status kubelet'
                - 'journalctl -xeu kubelet'

        Additionally, a control plane component may have crashed or exited when started by the container runtime.
        To troubleshoot, list all containers using your preferred container runtimes CLI.

        Here is one example how you may list all Kubernetes containers running in docker:
                - 'docker ps -a | grep kube | grep -v pause'
                Once you have found the failing container, you can inspect its logs with:
                - 'docker logs CONTAINERID'

error execution phase wait-control-plane: couldn't initialize a Kubernetes cluster
To see the stack trace of this error execute with --v=5 or higher

[在 Ubuntu 上重新安裝 Kubernetes](https://www.akiicat.com/2019/04/26/Kubernetes/kubernetes-reinstall-on-ubuntu/)



Collecting installation results ...
#####################################################
###              Welcome to KubeSphere!           ###
#####################################################

Console: http://192.168.1.11:30880
Account: admin
Password: P@88w0rd

NOTES：
  1. After you log into the console, please check the
     monitoring status of service components in
     "Cluster Management". If any service is not
     ready, please wait patiently until all components 
     are up and running.
  2. Please change the default password after login.

#####################################################
https://kubesphere.io             2021-10-11 00:31:00
#####################################################


## 问题汇总
* [k8s dashboard 的http接口改造](https://cloud.tencent.com/developer/article/1500710)
* [Kubernetes Dashboard不安全HTTP部署](https://spex.top/archives/kubernetes-dashboard-http-deploy.html)

https://github.com/kubernetes/dashboard/issues/4179

2021/10/13 16:24:42 Non-critical error occurred during resource retrieval: statefulsets.apps is forbidden: User "system:serviceaccount:kubernetes-dashboard:kubernetes-dashboard" cannot list resource "statefulsets" in API group "apps" at the cluster scope
2021/10/13 16:24:42 Non-critical error occurred during resource retrieval: jobs.batch is forbidden: User "system:serviceaccount:kubernetes-dashboard:kubernetes-dashboard" cannot list resource "jobs" in API group "batch" at the cluster scope
2021/10/13 16:24:42 Non-critical error occurred during resource retrieval: cronjobs.batch is forbidden: User "system:serviceaccount:kubernetes-dashboard:kubernetes-dashboard" cannot list resource "cronjobs" in API group "batch" at the cluster scope


kubectl create clusterrolebinding serviceaccount-cluster-admin --clusterrole=cluster-admin --group=system:serviceaccount clusterrolebinding.rbac.authorization.k8s.io/serviceaccount-cluster-admin created