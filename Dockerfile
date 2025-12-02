FROM docker:29.1.1-dind

ARG VERSION

WORKDIR /app
COPY docker-entrypoint.sh .

RUN apk add --no-cache \
    curl \
    libc6-compat \
    bash && \
    curl -LO \
    https://github.com/kubernetes/minikube/releases/download/v${VERSION}/minikube-linux-amd64 && \
    install -m 0755 minikube-linux-amd64 /usr/local/bin/minikube && \
    rm minikube-linux-amd64 && \
    chmod +x docker-entrypoint.sh

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
