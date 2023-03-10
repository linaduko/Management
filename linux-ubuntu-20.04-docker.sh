#!/bin/bash

apt-get remove docker docker-engine docker.io containerd runc

wget -O containerd.io.deb https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/containerd.io_1.6.9-1_amd64.deb
wget -O docker-ce.deb https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce_23.0.1-1~ubuntu.20.04~focal_amd64.deb
wget -O docker-ce-cli.deb https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce-cli_23.0.1-1~ubuntu.20.04~focal_amd64.deb
wget -O docker-buildx-plugin.deb https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-buildx-plugin_0.10.2-1~ubuntu.20.04~focal_amd64.deb
wget -O docker-compose-plugin.deb https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-compose-plugin_2.6.0~ubuntu-focal_amd64.deb

dpkg -i ./containerd.io.deb \
./docker-ce.deb \
./docker-ce-cli.deb \
./docker-buildx-plugin.deb \
./docker-compose-plugin.deb

service docker start
systemctl enable docker.service
systemctl enable containerd.service

usermod -aG docker $USER

#LinOps