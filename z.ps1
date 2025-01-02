docker build -t boriswilliams/php-nginx . --progress=plain
docker push boriswilliams/php-nginx
helm install simple . --wait
kubectl exec -it pod/$($(kubectl get pods)[1].split(' ')[0]) -- /bin/bash