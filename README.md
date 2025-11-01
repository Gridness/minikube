# Unofficial minikube Docker image
This repository checks official minikube repo for new versions and automatically builds a Docker image for it. To use simply do

```bash
docker run --privileged -d --name minikube ghcr.io/gridness/minikube:1.37.0
```

> [!NOTE]
> The image is based on `docker:28.5.1-dind`, meaning it runs on alpine linux

> [!IMPORTANT]
> Due to requirements of minikube the container is run in root mode. **Do not use it in production**
