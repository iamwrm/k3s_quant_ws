DOCKER_BUILDKIT=1 docker build -t dev_container -f docker/dev.dockerfile . 
# DOCKER_BUILDKIT=1 docker build -t kasm -f docker/kasm.dockerfile . 

docker save dev_container | sudo k3s ctr images import - 

sudo k3s ctr i ls

