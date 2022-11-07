

docker run \
    -p 1022:22 \
    --restart=unless-stopped \
    --name dev_container \
    -d dev_container

