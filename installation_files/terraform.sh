#! /bin/bash
#pass ------>>>>  yes | sh <scriptname>.sh to pass yes on all the prompts in this file.

#install on linux
#sudo yum install -y yum-utils shadow-utils
#sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
#sudo yum -y install terraform
#install terraform on ubuntu
sudo apt update
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
