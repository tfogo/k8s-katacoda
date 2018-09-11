Kubernetes watches pods to check if they are running or not. You can define exactly how Kubernetes determines if a pod is healthy by defining a liveness probe. See `pod-with-liveness.yml` for an example:

`cat pod-with-liveness.yml`{{execute}}

Here we define a liveness probe by making an HTTP request to the `/healthz` endpoint. If that returns a 200 then we know the app is running correctly.

Let's run this pod:

`kubectl apply -f pod-with-liveness.yml`{{execute}}

We can see this using:

`kubectl get pods -o wide`{{execute}}

And we can see what the `/healthz` endpoint returns:

`curl <pod-ip>:8080/healthz`

You can also define a readiness probe. Whereas liveness determines if a process is running correctly. Readiness is meant to test if a process is ready to start receiving traffic. For example, a Pod may need to do a lot of setup after it started before it is able to start accepting workloads.

This is useful so Services know which pods to send traffic to.
