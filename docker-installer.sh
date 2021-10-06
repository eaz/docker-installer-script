#!/bin/sh

# requires Debian/Ubuntu Linux

# run as: $ curl -s https://raw.githubusercontent.com/eaz/docker-installer-script/main/docker-installer.sh | bash -s 

sudo apt update
sudo apt upgrade

curl -fsSL https://get.docker.com -o get-docker.sh 
sh get-docker.sh 
rm get-docker.sh

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

sudo systemctl restart docker.service

sudo apt install -y docker-compose
