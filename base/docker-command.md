### useful docker commands

#### base command

* **docker ps** list running containers
* **docker ps -a** list all container inclouding stopped container
* **docker pull** download a image from Docker Hub registry
* **docker build** build your own container based on a Dockerfile
* **docker images**, **docker image ls** show all local storage images
* **docker run** run a docker container based on an image. **docker run myimage -it bash**
* **docker logs**, **docker logs -f mycontainer** display the logs of a container
* **docker volume ls** lists the volumes (persisting data of Docker containers)
* **docker network ls** list all network available for docker container
* **docker network connect** add the container to the given container network.
* **docker rm** removes one or more containers. **docker rm mycontainer** make sure the container is not running
* **docker rmi** remove one or more images. **docker rmi myimage** make sure no running container is based on that image
* **docker stop** stop one or more containers. **docker stop mycontainer** stop one container, **docker stop `$(docker ps -a -q)`** stop all running containers
* **docker start** start a stopped container using the last state
* **docker update --restart=no**  updates container policies, that is especially helpful when your container is stuck in a crash loop
* **docker cp** to copy files from a running container to the host or the way around. **docker cp :/etc/file .** to copy /etc/file to your current directory.

#### combinations command

* **docker kill `$(docker ps -q)`**  kill all running containers
* **docker rm `$(docker ps -a -q)`** delete all stopped containers
* **docker rmi `$(docker images -q)`** delete all images
* **docker update --restart=no && docker stop** update and stop a container that is in a crash-loop
* **docker exec -i -t /bin/bash** bash shell into container or use /bin/sh
* **docker exec -i -t -u root /bin/bash** bash shell with root if container is running in a different user context
* **docker exec -it [container_id_or_name/bb70afae9956] /bin/bash** bash shell into container

#### resource usage

* **docker ps -s** Get docker container including size
* **docker system df** Get docker container disk utilization

#### wasted resources

* **docker image prune** a pretty safe command to clean up your local filesystem: remove local container images that are not used by any container and are not tagged.
* **docker image prune -a**  clean up and delete all unused container images
* **docker image prune -a --filter "until=24h"**  clean up container images that have been created over 24 hours ago run
