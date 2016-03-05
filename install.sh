#!/bin/sh


. `dirname "$0"`/init.sh


update_git_repo https://leshikus@github.com/leshikus/ansible.git
modify_if_unchanged ansible contrib/inventory/zabbix.ini

python "$pdir/ansible/contrib/inventory/zabbix.py" --list >"$dir"/hosts.zabbix || {
  die "Error: getting dynamic inventory from Zabbix failed"
}

# update_git_repo https://leshikus@github.com/leshikus/ansible-zabbix-agent.git
# ln -s "$pdir"/ansible-zabbix-agent "$dir"/roles/dj-wasabi.zabbix-agent
