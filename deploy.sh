docker build -t takumi47/multi-client:latest -t takumi47/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t takumi47/multi-server:latest -t takumi47/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t takumi47/multi-worker:latest -t takumi47/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push takumi47/multi-client:latest
docker push takumi47/multi-server:latest
docker push takumi47/multi-worker:latest
docker push takumi47/multi-client:$SHA
docker push takumi47/multi-server:$SHA
docker push takumi47/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=takumi47/multi-client:$SHA
kubectl set image deployments/server-deployment server=takumi47/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=takumi47/multi-worker:$SHA
