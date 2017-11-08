#!/bin/zsh
## Used when setting up a new server with root access, such as DO Dropleet

if [[ ! -e vars_newserver.yml ]]; then
    echo "You need to have vars_newserver.yml in the directory. You can copy vars_newserver.yml.template and modify it accordingly."
    exit 1;
fi


# We can assume that root is setup with public keys
## echo "Enter server's root password: "
## read -s root_passwd

echo "Enter new password to set for user as well as root: "
read -s user_passwd
# TODO: Add password confirmation logic + password size logic
echo "Enter server's IP address: "
read serverip

user_passwd_crypt=$(openssl passwd -salt SomeSaltButNoPepper -1 $user_passwd)

ssh root@${serverip} 'apt-get -y install python'

ansible-playbook -u root -i $serverip, newserver.yml --extra-vars "root_password=$root_passwd user_passwd_crypt=$user_passwd_crypt"
