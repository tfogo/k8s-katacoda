Generally you define the specification of Kubernetes objects in YAML filesi called manifests. Let's take a look at `pod.yml`:

`cat pod.yml`{{execute}}

The `apiVersion` and the `kind` define the type of object we want to create. We give it the `name` "devops". And then we have a spec for the containers to run inside the pod.

Here we are running one container from the default DockerHub registry, `tfogo/devops`. This is a simple nginx container which will serve some content on port 80.  We expose port 80 on the pod.

You can submit manifests to the Kubernetes API by using the `kubectl apply` command:

`kubectl apply -f pod.yml`{{execute}}

This will submit the manifest to the API. Kubernetes will then schedule this pod onto a healthy node in the cluster. Let's see how our pod is doing:

`kubectl get pods`{{execute}}

We can see detailed information about a specific resource by using `kubectl describe`. Let's take a look at our `devops` pod:

`kubectl describe pod devops`{{execute}}

The pattern here is `kubectl describe <resource-type> <resource-name>`. Here we see detailed information about the pod: Where it's scheduled, its IP, its status, events in its history, etc. Let's try curling its IP address. You should see it output "Smooth DevOps". Notice how the Pod IP is accessible from any node in the cluster.

## Resource requests

You can let Kubernetes know how much CPU and RAM your containers need. You can also limit how much CPU and RAM your containers use up. You can do this by specifying the resource section in the Pod manifest. Take a look at `pod-with-resources.yml`:

`cat pod-with-resources.yml`{{execute}}

Here we request a minimum of half a CPU core and 128MB of RAM. We also set an upper limit of one core and 256MB of RAM. If we apply this manifest, Kubernetes will update our pod with these requests (make new pod or update?):

`kubectl apply -f pod-with-resources.yml`{{execute}}

## (Health checks??)

## Labels and annotations

When you have a lot of Pods in your cluster you want a way to be able to organize, sort, and identify your Pods. So Kubernetes allows you to add Labels to your resources. These are key/value pairs which are specifically used to identify resources. For example: `version=2.0.3`, `env=production`, `app=frontend`.

Labels are used by some resources to match and point to other resources. For example, Services point to a group of Pods that have a certain set of labels.

Annotations are also key/value pairs, but they are meant for non-identifying information. They are a place to store additional metadata about Kubernetes objects. Annotations are mostly used to store data that is useful for other tools and libraries but are sometimes used by Kubernetes itself.

If you're unsure about the difference between labels and annotations. Labels are selectors, and annotations are all other metadata.

Take a look at `pod-with-labels.yml`:

`cat pod-with-labels`{{execute}}

We add a couple of labels and an annotation to the Pod.

