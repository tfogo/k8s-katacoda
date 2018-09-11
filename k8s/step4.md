Now you know how to deploy single Pods, but in the real world you want to deploy a set of Pods and have an easy way to scale and update that set. This is where the Deployment resource comes in.

`watch kubectl get pods`{{execute HOST2}}

Let's look at the definition of a deployment:

`cat deployment.yml`

Here in the spec you'll notice we set `replicas: 3` which will tell Kubernetes we want to maintain 3 replicas of this Pod. Let's apply this resource:

`kubectl apply -f deployment.yml`{{execute}}

We should see the pods spinning up. It's easy to scale a deployment - simply change the number of replicas and apply the definition again.

When make a change to the pods in a deployment, the deployment will perform a rolling update of its pods. Deployments allow you to set exactly how the rolling update occurs. For example, you can tell it to only replace one Pod at a time.

Let's update the version of the container we're deploying to `tfogo/devops:v2`:

`kubectl apply -f deployment-v2.yml`{{execute}}

You can check the status of a deployment with this command:

`kubectl rollout status deployment devops`{{execute}}

You can see the history of rollouts too:

`kubectl rollout history deployment devops`{{execute}}

If you want to rollback a rollout, you can always re-apply an old manifest, or use this handy command:

`kubectl rollout undo deployment devops --to-revision=1`{{execute}}

