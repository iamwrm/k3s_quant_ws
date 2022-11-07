FROM ubuntu:20.04

ARG USER_NAME=ubuntu
ARG USER_ID=1000

ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update \ 
    && apt-get install -y \
        openssh-server \
        xauth \
        sudo \
    && rm -rf /var/lib/apt/list/* \
    && mkdir /var/run/sshd \
    && ssh-keygen -A \
    && sed -i "s/^.*PasswordAuthentication.*$/PasswordAuthentication yes/" /etc/ssh/sshd_config \
    && sed -i "s/^.*X11Forwarding.*$/X11Forwarding yes/" /etc/ssh/sshd_config \
    && sed -i "s/^.*X11UseLocalhost.*$/X11UseLocalhost no/" /etc/ssh/sshd_config \
    && grep "^X11UseLocalhost" /etc/ssh/sshd_config || echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
RUN \
    useradd -l -u ${USER_ID} -G sudo -md /home/${USER_NAME} -s /bin/bash -p ${USER_NAME} ${USER_NAME} \
    && echo "%sudo ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

ENTRYPOINT ["sh", "-c", "/usr/sbin/sshd && tail -f /dev/null"]