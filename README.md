# ansible-contrib

These playbooks are meant to be a reference guide to building an infrastructure on the top
of Proxmox Virtual Environment. The stack includes several virtualization nodes, web servers
and databases.

The inventory file 'hosts' is managed via Zabbix Server 2.4. It defines the hosts in the following way.

        [proxmox]
        ovh2

        [nginx]
        webhost1

        [db]
        db1

Here the webserver would be configured on web1 with the db server on db1.
To run the maintenance enter the following command:

        ansible-playbook -i hosts update.yml

