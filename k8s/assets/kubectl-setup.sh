if [ $(hostname) == "node01" ]
then
  mkdir $HOME/.kube
  cp /etc/kubernetes/kubelet.conf $HOME/.kube/config
fi
