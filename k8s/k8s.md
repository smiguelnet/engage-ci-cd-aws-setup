# Kubernetes

List of useful commands to deploy Engage API at AWS EKS using Kubectl

## Local Setup

First test the whole environment locally using [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)

### minikube init

```sh
minikube start
```

### minikube cockpit

```sh
minikube dashboard
```

### create a deployment

```sh
kubectl create deployment engage-node --image=smiguelnet/engage
```

### check deployments

```sh
kubectl get deployments
```

### check pods

```sh
kubectl get pods
```

### check events

```sh
kubectl get events
```

### view configuration

```sh
kubectl config view
```

### create a service - expose POD to external network

```sh
kubectl expose deployment engage-node --type=LoadBalancer --port=8080
```

### check services

```sh
kubectl get services
```

### Provision IP to access the service

```sh
minikube service engage-node
```

---

## Cleaning up created items

```sh
kubectl delete service engage-node
kubectl delete deployment engage-node

minikube stop
minikube delete
```

---

## AWS Setup \* EKS Under Evaluation

Using provided yaml filest to create and remove the deployments and services.

Creating resources

```sh
kubectl apply -f k8s-deployment.yml
kubectl apply -f k8s-service.yml
```

Removing resources

```sh
kubectl delete -f k8s-service.yml
kubectl delete -f k8s-deployment.yml
```
