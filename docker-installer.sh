#!/bin/sh

# requires Debian/Ubuntu Linux

# run as: $ curl -s https://raw.githubusercontent.com/eaz/docker-installer-script/main/docker-installer.sh | bash -s

# $ sysctl -w vm.max_map_count=262144
# $ sysctl -w fs.file-max=65536
# $ ulimit -n 65536
# $ ulimit -u 4096

sudo apt -y update
sudo apt upgrade

sudo apt-get remove docker docker-engine docker.io containerd runc

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh

sudo sed -i 's+ExecStart=/usr/bin/dockerd+ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:20202+' /lib/systemd/system/docker.service

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

sudo systemctl restart docker.service

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose --version

#sudo apt install -y docker-compose

# sudo systemctl daemon-reload
# sudo service docker restart
