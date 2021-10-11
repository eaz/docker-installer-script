#!/bin/sh

# requires Debian/Ubuntu Linux

# run as: $ curl -s https://raw.githubusercontent.com/eaz/docker-installer-script/main/docker-installer.sh | bash -s

sudo apt -y update
sudo apt upgrade

curl -fsSL https://get.docker.com -o get-docker.sh
bash -s get-docker.sh
rm get-docker.sh

sudo sed -i 's+ExecStart=/usr/bin/dockerd+ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:20202+' /lib/systemd/system/docker.service

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

sudo systemctl restart docker.service

sudo apt install -y docker-compose
