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