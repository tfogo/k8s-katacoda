if [ $(hostname) == "host01" ]
then
  mkdir $HOME/.kube
  cp /etc/kubernetes/kubelet.conf $HOME/.kube/config
fi
