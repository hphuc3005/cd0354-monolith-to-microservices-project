## Apply env variables and secrets
kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml
## Deployments - Double check the Dockerhub image name and version in the deployment files
kubectl apply -f udagram-api-feed/deployment.yaml
kubectl apply -f udagram-api-user/deployment.yaml
kubectl apply -f udagram-frontend/deployment.yaml
kubectl apply -f udagram-reverseproxy/deployment.yaml
## Service
kubectl apply -f udagram-api-feed/service.yaml
kubectl apply -f udagram-api-user/service.yaml
kubectl apply -f udagram-frontend/service.yaml
kubectl apply -f udagram-reverseproxy/service.yaml

## Check the deployment names and their pod status
kubectl get deployments
## Create a Service object that exposes the frontend deployment
## The command below will ceates an external load balancer and assigns a fixed, external IP to the Service.
kubectl expose deployment frontend --type=LoadBalancer --name=publicfrontend
kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy
## Check name, ClusterIP, and External IP of all deployments
kubectl get services 
kubectl get pods # It should show the STATUS as Running