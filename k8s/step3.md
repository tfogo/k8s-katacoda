So we have a Pod with an IP that we can access from within the cluster. But one of the main points of Kubernetes is that a node can go down with all the pods on it and Kubernetes will bring up all the pods again on another node in an instant.

This means that the Pod IP can change. And what if you have multiple Pods of the same application, how do you route to that application.

This is where the Service object comes in. The Service is a layer in front of a group of pods.

`kubectl apply -f service.yml`

`kubectl get services`

`curl <cluster-ip>`


`kubectl apply -f service-node-port.yml`

`kubectl get services -o wide`

`kubectl describe services devops`

`curl <node-ip>:<node-port>`
