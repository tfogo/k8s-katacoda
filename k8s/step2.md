Generally you define the specification of Kubernetes objects in YAML files called manifests. Let's take a look at `pod.yml`:

`cat pod.yml`{{execute}}

The `apiVersion` and the `kind` define the type of object we want to create. We give it the `name` "devops". And then we have a spec for the containers to run inside the pod.

Here we are running one container from the default DockerHub registry, `tfogo/devops`. This is a simple nginx container which will serve some content on port 8080. We expose port 8080 on the pod.

You can submit manifests to the Kubernetes API by using the `kubectl apply` command:

`kubectl apply -f pod.yml`{{execute}}

This will submit the manifest to the API. Kubernetes will then schedule this pod onto a healthy node in the cluster. Let's see how our pod is doing:

`kubectl get pods`{{execute}}

We can see detailed information about a specific resource by using `kubectl describe`. Let's take a look at our `devops` pod:

`kubectl describe pod devops`{{execute}}

The pattern here is `kubectl describe <resource-type> <resource-name>`. Here we see detailed information about the pod: Where it's scheduled, its IP, its status, events in its history, etc. Let's try curling its IP address at port 8080. You should see it output "Smooth DevOps".

You can also easily get the IP address from:

`kubectl get pod devops -o wide`{{execute}}

Notice how the Pod IP is accessible from any node in the cluster!

