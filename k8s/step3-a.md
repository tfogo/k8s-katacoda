There are several different types of Services. We just saw the default: ClusterIP. But services can expose applications in more ways. If we look at `service-node-port.yml` we've added `type: NodePort`:

`cat service-node-port.yml`{{execute}}

Now when we apply this, the service will pick a port (around the 30000 range). When you connect to any node in the cluster at this port, it will forward to the Service.

`kubectl apply -f service-node-port.yml`{{execute}}

`kubectl get services -o wide`{{execute}}

`kubectl describe services devops`{{execute}}

You can see in the `Node Port` section the port on any node where the service is visible.

`curl <node-ip>:<node-port>`

On Katacoda, you can click the "+" icon to view a port on any host you want. So try that out now.

## Load Balancers

By using `type: LoadBalancer`, Kubernetes will provision a cloud load balancer and point it to the Pods. This is useful for publishing your service externally.

This won't work in this sandbox, since this sandbox won't provision a load balancer.
