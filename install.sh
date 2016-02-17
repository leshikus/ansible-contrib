#!/bin/sh

. `dirname "$0"`/init.sh

ansible_url=https://leshikus@github.com/leshikus/ansible.git

sudo yum install epel-release
sudo yum install ansible

if cd "$dir"/../ansible
then
  git pull
else
  git clone https://leshikus@github.com/leshikus/ansible.git
fi

