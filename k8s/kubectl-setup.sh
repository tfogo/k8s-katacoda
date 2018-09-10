#!/bin/bash

if [ $(hostname) == "node01" ]
then
  mkdir $HOME/.kube
  cp /etc/kubernetes/kubelet.conf $HOME/.kube/config
else
  kubectl create clusterrolebinding node-admin-binding --clusterrole=cluster-admin --user=system:node:node01
fi
