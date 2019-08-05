#!/bin/bash

#Update the apt package
sudo apt-get update -y

#Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.
sudo apt-key fingerprint 0EBFCD88

#Use the following command to set up the stable repository.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#install docker engine
sudo apt-get update -y

#Install the latest version of Docker Engine - Community and containerd, or go to the next step to install a specific version:
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# To install a specific version of Docker Engine - Community, list the available versions in the repo, then select and install:
#List the versions available in your repo:
apt-cache madison docker-ce

#Install a specific version using the version string from the second colum
#sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
sudo apt-get install docker-ce=18.06.3~ce~3-0~ubuntu docker-ce-cli=18.06.3~ce~3-0~ubuntu containerd.io


#Verify that Docker Engine - Community is installed correctly by running the hello-world image.
sudo docker run hello-world