When you have a lot of Pods in your cluster you want a way to be able to organize, sort, and identify your Pods. So Kubernetes allows you to add Labels to your resources. These are key/value pairs which are specifically used to identify resources. For example: `version=2.0.3`, `env=production`, `app=frontend`.

Labels are used by some resources to match and point to other resources. For example, Services point to a group of Pods that have a certain set of labels.

Annotations are also key/value pairs, but they are meant for non-identifying information. They are a place to store additional metadata about Kubernetes objects. Annotations are mostly used to store data that is useful for other tools and libraries but are sometimes used by Kubernetes itself.

If you're unsure about the difference between labels and annotations. Labels are selectors, and annotations are all other metadata.

Take a look at `pod-with-labels.yml`:

`cat pod-with-labels`{{execute}}

We add a couple of labels and an annotation to the Pod.

