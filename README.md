### Overview

Personal collection of my Ansible Playbooks

### Usage

Setting things up on localhost is as simple as

	git clone https://github.com/sharjeel/ansible-playbooks.git
	cd ansible-playbooks
	ansible-playbook -K -i localhost userapps.yml

The other playbook `ubuntu.yml` is for servers.


### Quick installation

	curl -L https://github.com/sharjeel/ansible-playbooks/raw/master/userapps.sh | sudo sh
