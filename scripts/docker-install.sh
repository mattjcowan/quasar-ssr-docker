#!/bin/bash

# For linux (this script), see: https://docs.docker.com/engine/install/ubuntu/
# For windows, see: https://docs.docker.com/docker-for-windows/install/

# Remove previous versions of docker
sudo apt-get remove docker docker-engine docker.io containerd runc -y

# Update package list & install necessary dependencies
sudo apt-get update -y
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release -y

# Add Docker's GPG key to your local mashine
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo chmod a+r /usr/share/keyrings/docker-archive-keyring.gpg

# Setup repository
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine, containerd, and Docker Compose.
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Try running a docker container using:
# sudo docker run --rm hello-world
# sudo docker rmi hello-world

# See instructions at https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user to allow running docker without `sudo` everytime ...

# -> `docker` group may already exist, otherwise create it
# sudo groupadd docker
# -> add users to group (check list of users at `ls /home/ -al``)
# sudo usermod -aG docker $USER
# sudo usermod -aG docker anotheruser1
# sudo usermod -aG docker anotheruser2
# -> check docker members
# getent group docker
# -> log out and log back in

