`watch kubectl get pods`

`watch kubectl get replicasets -o wide`

`kubectl apply -f deployment.yml`

`kubectl scale deployment devops --replicas=2`

`kubectl scale deployment devops --replicas=5`

`kubectl apply -f deployment-v2.yml`

`kubectl rollout status deployment devops`

`kubectl rollout history deployment devops`

`kubectl rollout undo deployment devops --to-revision=1`

