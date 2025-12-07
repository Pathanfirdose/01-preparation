# what is Ansible - configuration management tool

   Ansible is an open-source automation tool used for configuration management, application deployment, orchestration, and IT task automation, and it works by connecting to servers over SSH without requiring any agents to be installed on those servers. 
   
   It uses simple YAML files called **playbooks** to define the desired state of systems, making automation easy to write, read, and maintain, and it allows you to manage hundreds of servers at once with consistent, repeatable results.

   ssh ec2-user@52.10.20.14 -c "echo 'helloworld' > /temp/hello.txt

   sudo dnf install ansible -y

# what is inventory

   In Ansible, an **inventory** is a file that lists all the servers (hosts) you want to manage, grouping them logically so Ansible knows where to run tasks and playbooks, and it can be written in formats like INI, YAML, or dynamically generated from cloud providers. It defines hostnames, IP addresses, groups (like *webservers*, *dbservers*), and optional variables for each host or group, allowing Ansible to target specific machines easily during automation.

   

# ANSIBLE AADHOC COMMANDS

   In Ansible, **adhoc commands** are one-line commands used to perform quick, immediate tasks on remote servers without writing a playbook, and they are useful for simple actions like checking connectivity, managing packages, restarting services, or copying files. They use the `ansible` command followed by a host or group from the inventory and a module, for example: `ansible all -m ping` to test connectivity, or `ansible web -m yum -a "name=httpd state=present"` to install a package on all web servers.

# playbook 

# ex1:- 01-ping.yml

- name: ping server
  host: web
  tasks: 
  - name: ping the server
    ansible.builtin.package:

  


# syntax ansible -i <ip>, all -e ansible_user=ec2-user -e ansible_password=DevOps321 -m ping

   ansible -i 172.31.27.28, all -e ansible_user=ec2-user -e ansible_password=DevOps321 -m ping

   ansible -i 172.31.27.28, all -e ansible_user=ec2-user -e ansible_password=Devops321 -b -m dnf -a "name=nginx state=installed"

   ansible -i 172.31.27.28, all -e ansible_user=ec2-user -e ansible_password=DevOps321 -b -m service -a "name=nginx state=started"


# PLAYBOOK COMMANDS 


ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=Devops321 01-ping.yaml

ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 02-multi-play.yaml 

ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 03-nginx.yaml 

ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 04-variables.yaml 

ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 05-task-vars.yaml 

ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 06-vars-files.yaml 

ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 07-vars-prompt.yaml 

ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 08-vars-from-inventory.yaml 

ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 09-vars-from-args.yaml -e "NAME=firdose GREETING=morning" 

ansible-playbook -i inventory.ini -e ansible_user=ec2-user -e ansible_password=DevOps321 10-vars-preference.yaml -e "COURSE=devops with orgs" 

/etc/ansible/ansible.cfg

# to list all the ungrouped servers from inventory
ansible -i inventory.ini ungrouped --list-hosts

# to list all the web group servers from inventory
ansible -i inventory.ini web --list-hosts

# to list all the backend servers from inventory
ansible -i inventory.ini backend --list-hosts

# to list all the servers from inventory
ansible -i inventory.ini all --list-hosts