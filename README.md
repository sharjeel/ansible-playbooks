### Overview

Personal collection of my Ansible Playbooks

### Usage

Setting things up on localhost is as simple as

	git clone https://github.com/sharjeel/ansible-playbooks.git
	cd ansible-playbooks
	ansible-playbook -K -i localhost userapps.yml

The other playbook `ubuntu.yml` is for servers.


### Quick reference to pre-reqs on installation a fresh ubuntu machine

	sudo apt-get update && sudo apt-get install git python-pip
	sudo pip install ansible
