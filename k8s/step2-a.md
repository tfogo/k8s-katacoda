You can let Kubernetes know how much CPU and RAM your containers need. You can also limit how much CPU and RAM your containers use up. You can do this by specifying the resource section in the Pod manifest. Take a look at `pod-with-resources.yml`:

`cat pod-with-resources.yml`{{execute}}

Here we request a minimum of half a CPU core and 128MB of RAM. We also set an upper limit of one core and 256MB of RAM. If we apply this manifest, Kubernetes will update our pod with these requests (make new pod or update?):

`kubectl apply -f pod-with-resources.yml`{{execute}}

## Deleting Pods

You can delete resources with the `kubectl delete` command:

`kubectl delete pod devops-with-resources`{{execute}}
