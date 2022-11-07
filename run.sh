sudo docker run --rm  -it --shm-size=512m -p 6901:6901 -e VNC_PW=password kasmweb/ubuntu-focal-desktop:1.11.0

docker run \
    -p 1022:22 \
    --restart=unless-stopped \
    --name dev_container \
    -d dev_container

