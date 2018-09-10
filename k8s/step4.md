`watch kubectl get pods`{{execute}}

`watch kubectl get replicasets -o wide`{{execute}}

`kubectl apply -f deployment.yml`{{execute}}

scale

`kubectl apply -f deployment-v2.yml`{{execute}}

`kubectl rollout status deployment devops`{{execute}}

`kubectl rollout history deployment devops`{{execute}}

`kubectl rollout undo deployment devops --to-revision=1`{{execute}}

