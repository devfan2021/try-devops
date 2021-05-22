## Set up the volumes location
```
export GITLAB_HOME=/data/gitlab
```

## gitlab-runner register
```
docker exec -it [container-id/container-name] bash
```

```
gitlab-runner register \
--executor="docker" \
--custom_build_dir-enabled="true" \
--docker-image="maven:3.6.1-jdk-11" \
--url="http://gitlab.devfan.site:8090" \
--clone-url="http://gitlab.devfan.site:8090" \
--registration-token="z2iSLxyz1sKAyyoPy6Hs" \
--description="docker-runner" \
--tag-list="docker" \
--run-untagged="true" \
--locked="false" \
--docker-network-mode="gitlab-network" \
--docker-disable-cache="true" \
--docker-privileged="true" \
--cache-dir="/cache" \
--builds-dir="/builds" \
--docker-volumes="gitlab-runner-builds:/builds" \
--docker-volumes="gitlab-runner-cache:/cache"
```

## Install GitLab using Docker Compose
* https://docs.gitlab.com/omnibus/docker/


## Gitlab CI/CD
*[Building in Docker Containers on GitLab CE](https://www.ivankrizsan.se/2019/06/17/building-in-docker-containers-on-gitlab-ce/)
*[How to deploy Maven projects to Artifactory with GitLab CI/CD](https://forge.etsi.org/rep/help/ci/examples/artifactory_and_gitlab/index.md)
*[GitLab-CI Pipeline](https://ishitasinghal08.medium.com/gitlab-ci-pipeline-44996e611fe2)
https://forge.etsi.org/rep/help/ci/docker/using_docker_build.md
https://gitlab.com/gitlab-examples/maven/simple-maven-example
https://www.cnblogs.com/cjsblog/p/12256843.html



maven:
https://howtodoinjava.com/maven/maven-parent-child-pom-example/


https://spring.io/
https://github.com/alibaba/transmittable-thread-local#-user-guide


组合注解
https://yanbin.blog/java-spring-meta-annotation/
https://zhuanlan.zhihu.com/p/95815525


java内存模型
https://www.infoq.cn/article/java-memory-model-1/
https://zhuanlan.zhihu.com/p/38348646
https://www.jianshu.com/p/bf158fbb2432
https://www.jianshu.com/p/76959115d486
https://zhuanlan.zhihu.com/p/101495810


缓存：
https://github.com/ben-manes/caffeine
https://github.com/google/guava/wiki/CachesExplained


响应式编程
http://reactivex.io/intro.html


https://developer.aliyun.com/article/703059
蚂蚁金服面对亿级并发场景的组件体系设计
