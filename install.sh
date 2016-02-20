#!/bin/sh


. `dirname "$0"`/init.sh


update_git_repo https://leshikus@github.com/leshikus/ansible.git
modify_if_unchanged ansible contrib/inventory/zabbix.ini

python "$pdir/ansible/contrib/inventory/zabbix.py" --list || {
  die "Error: getting dynamic inventory from Zabbix failed"
}

