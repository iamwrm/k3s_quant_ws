DOCKER_BUILDKIT=1 docker build -t dev_container .

docker save dev_container | sudo k3s ctr images import -

sudo k3s ctr i ls

