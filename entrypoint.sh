#!/usr/bin/env bash
set -xeuo pipefail
wrapdocker true
CLUSTER_NAME="1"
if [ ! "$(grep "^${CLUSTER_NAME}$")" ]; then
    kind create cluster --name="${CLUSTER_NAME}"
    mv $(kind get kubeconfig-path --name="${CLUSTER_NAME}") $HOME/.kube/config
else
    echo "Clusters already running."
fi
$@