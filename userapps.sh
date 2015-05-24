#!/bin/sh

echo "Sudo'ing for the first time"
sudo echo "sudo'ed!"

which apt-get
APT_GET=$?
which pkg
PKG=$?

if [ $APT_GET -eq 0 ];then
  sudo apt-get update && sudo apt-get -y install git python-pip python-dev
elif  [ $PKG -eq 0 ]; then
  pkg update
  pkg install git python-pip python-dev
fi

sudo pip install ansible
git clone https://github.com/sharjeel/ansible-playbooks.git
cd ansible-playbooks
ansible-playbook -K -i localhost userapps.yml
