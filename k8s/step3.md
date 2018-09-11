So we have a Pod with an IP that we can access from within the cluster. But one of the main points of Kubernetes is that a node can go down with all the pods on it and Kubernetes will bring up all the pods again on another node in an instant.

This means that the Pod IP can change. And what if you have multiple Pods of the same application, how do you route to that application?

This is where the Service object comes in. The Service is a layer in front of a group of pods. By default a service will create a "Cluster IP" which is a virtual IP that can be routed to within the cluster. Let's look at how to define a service:

`cat service.yml`{{execute}}

You define a `selector`. This is a set of labels. Pods that match this set of labels will be fronted by the Service. You also define a `port` which is the port you need to access on the cluster IP, and a `targetPort`, the port you need to access on the pod.

This is a case of Kubernetes objects being _loosely coupled_. A service doesn't own pods. If you delete a service, the pods will remain. This makes it easier to carry out operational tasks such as moving pods to a different service.

Create the service by applying the yaml file:

`kubectl apply -f service.yml`{{execute}}

You can see the services here:

`kubectl get services`{{execute}}

Notice that we have two services. One is the one we just made, and one is the service that fronts the kube-apiserver.

The "INTERNAL_IP" is the Cluster IP that we can use to access this service.

`curl <cluster-ip>`

## Node Ports

There are several different types of Services. We just saw the default: ClusterIP. But services can expose applications in more ways. If we look at `service-node-port.yml` we've added `type: NodePort`:

`cat service-node-port.yml`{{execute}}

Now when we apply this, the service will pick a port (around the 30000 range). When you connect to any node in the cluster at this port, it will forward to the Service.

`kubectl apply -f service-node-port.yml`{{execute}}

`kubectl get services -o wide`{{execute}}

`kubectl describe services devops`{{execute}}

You can see in the `Node Port` section the port on any node where the service is visible.

`curl <node-ip>:<node-port>`

## Load Balancers

By using `type: LoadBalancer`, Kubernetes will provision a cloud load balancer and point it to the Pods. This is useful for publishing your service externally.

This won't work in this sandbox, since this sandbox won't provision a load balancer.
