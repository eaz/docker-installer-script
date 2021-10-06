#!/bin/sh

# requires Debian/Ubuntu Linux

sudo apt update
sudo apt upgrade

sudo -y install curl

curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh && rm get-docker.sh

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

sudo systemctl restart docker.service

sudo apt install -y docker-compose
