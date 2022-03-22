
# Sample of:
# - building an image from a dockerfile 
# - tagging and pushing an image to the local microk8s registery
# - fully deleting and reapplying a pod deployment

docker build . -t localhost:32000/discord-crypto:discord
docker push localhost:32000/discord-crypto:discord
cd ../
cd k8s/
microk8s.kubectl delete -f discord-crypto.yaml
microk8s.kubectl apply -f discord-crypto.yaml
