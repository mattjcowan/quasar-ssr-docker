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

# Install Docker
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
