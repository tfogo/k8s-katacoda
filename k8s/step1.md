`kubectl` is the command line tool that we use to communicate with a Kubernetes cluster. You can view Kubernetes resources by running `kubectl get <resource-type>`. Let's take a look at the nodes in our cluster:

`kubectl get nodes`{{execute}}

You can see we have two nodes, one master and one worker.

Let's look at the components of the cluster:

`kubectl get componentstatus`{{execute}}

This shows us that etcd, the scheduler, and the controller-manager are all working correctly.

Let's see if there are any pods:

`kubectl get pods`{{execute}}

We haven't deployed any pods yet, so that's expected. But if we look at the kube-system namespace (by adding -n kube-system) we can see that Kubernetes is actually running several of its own components in pods. That's a cool thing about Kubernetes, once you've bootstrapped some of the components, it can run the rest of the components itself.

`kubectl get pods -n kube-system -o wide`{{execute}}
