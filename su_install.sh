#!/bin/sh

. `dirname "$0"`/init.sh

test "$USER" == root || {
  die 'The script is intended to run by root'
}

yum install epel-release
yum install ansible python-pip
pip install zabbix-api

rm /etc/ansible/hosts
ln -s "$pdir/ansible/contrib/inventory/zabbix.py" /etc/ansible/hosts

ansible-galaxy install dj-wasabi.zabbix-agent

