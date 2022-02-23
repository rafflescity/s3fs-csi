#!/bin/bash -x

kubelet_path=${1:-/var/snap/microk8s/common/var/lib/kubelet}

for i in node.yaml controller.yaml; do 
  cat "$i" \
    | sed "s#/var/lib/kubelet#$kubelet_path#" \
    | kubectl apply -f -
done
