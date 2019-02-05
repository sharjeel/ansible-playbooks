#!/bin/zsh
## Used when setting up a new server with root access, such as DO Dropleet

if [[ ! -e vars_newserver.yml ]]; then
    echo "You need to have vars_newserver.yml in the directory. You can copy vars_newserver.yml.template and modify it accordingly."
    exit 1;
fi

if [[ -z $ssh_key_location ]]; then
    if [[ ! -e ~/.ssh/id_rsa ]]; then
	echo "Please enter the location of your private key for connecting to the new server"
	read ssh_key_location
    else
	ssh_key_location=~/.ssh/id_rsa
    fi
fi

# We can assume that root is setup with public keys
## echo "Enter server's root password: "
## read -s root_passwd

echo "Enter new password to set for user as well as root: "
read -s user_passwd
# TODO: Add password confirmation logic + password size logic

if [[ -z $serverip ]]; then
    echo "Enter server's IP address: "
    read serverip
fi

user_passwd_crypt=$(openssl passwd -salt SomeSaltButNoPepper -1 $user_passwd)

if type sshagent 2>/dev/null | grep function; then
    sshagent
else
    ssh-agent
fi

if [[ -z $isbsd ]]; then
    ssh -i $ssh_key_location root@${serverip} 'apt-get -y install python aptitude'
    ansible_python_interpreter=/usr/bin/python
else
    ssh -i $ssh_key_location root@${serverip} 'pkg update && pkg install -y python27'
    ansible_python_interpreter=/usr/local/bin/python2
fi

ansible-playbook -u root --private-key=$ssh_key_location \
		 -i $serverip, newserver.yml \
		 --extra-vars "ansible_python_interpreter=$ansible_python_interpreter user_passwd_crypt=$user_passwd_crypt"
