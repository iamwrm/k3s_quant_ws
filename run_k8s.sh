## prepare dev_home
mkdir -p /home/ubuntu/dev_home
cp user_home/* /home/ubuntu/dev_home/


sudo kubectl apply -f k8s/dev_container.yml

## Setup passwd 
## sudo kubectl exec -it deploy/dev -- bash -c "passwd ubuntu"

