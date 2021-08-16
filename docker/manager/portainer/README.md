## Deploying Portainer CE in Docker
Portainer is comprised of two elements, the Portainer Server, and the Portainer Agent. Both elements run as lightweight Docker containers on a Docker engine.

### Portainer Deployment
* Portainer Server Deployment
```
docker volume create portainer_data

docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /data/portainer_data:/data portainer/portainer-ce

```
* Portainer Agent Only Deployment
```
docker run -d -p 9001:9001 --name portainer_agent --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes portainer/agent
```

* Login Portainer Web: http://x.x.x.x:9000/