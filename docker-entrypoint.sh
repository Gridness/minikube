#!/bin/bash

function wait_for_daemon() {
    echo "Waiting for docker daemon..."
    {
    while ! docker ps
    do
        sleep 1
    done
    } > /dev/null 2>&1
}

function run() {
    dockerd-entrypoint.sh &

    wait_for_daemon
    minikube start \
        --force \
        --apiserver-ips="$(hostname -i)" \
        --listen-address=0.0.0.0

    tail -f /dev/null
}

run || exit 1
