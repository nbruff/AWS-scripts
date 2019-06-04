#!/bin/bash
apt update -y
apt install docker.io -y
systemctl start docker
systemctl enable docker
usermod -aG docker $USER
docker pull wordpress
docker run --name mywordpress -p 8080:80 -d wordpress

