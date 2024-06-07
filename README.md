# ssh-configurator

## 1. edit roles/ssh/vars/main.yml

``` yml
---
ssh_hosts:
  - name: vm_alma89
    ip: 192.168.100.1
    user: almalinux

  - name: vm_alma94
    ip: 192.168.100.2
    user: almalinux

  - name: vm_ubuntu2004
    ip: 192.168.100.3
    user: ubuntu

  - name: vm_ubuntu2204
    ip: 192.168.100.4
    user: ubuntu

  - name: vm_rocky88
    ip: 192.168.100.10
    user: rocky
    key_indiv: yes
```

## 2. run setup_ssh.yml

``` log
ansible-playbook setup.yml
```

## 3. result

``` log
[root@adm ~]$ ls -l /keys/common* /keys/vm_*
-rw------- 1 root root 3401 May 30 03:00 /keys/common.id_rsa
-rw------- 1 root root  754 May 30 03:00 /keys/common.id_rsa.pub
-rw------- 1 root root 3357 May 31 01:34 /keys/vm_rocky88.id_rsa
-rw------- 1 root root  726 May 31 01:34 /keys/vm_rocky88.id_rsa.pub

===

[root@adm ~]$ cat /etc/ssh/ssh_config.d/ssh-configurator.conf
# === all host settings ===
Host *
    ServerAliveInterval 15
    ServerAliveCountMax 10
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null

# === ssh_hosts settings ===
Host vm_alma89
  Hostname 192.168.100.1
  User almalinux
  IdentityFile /keys/common.id_rsa

Host vm_alma94
  Hostname 192.168.100.2
  User almalinux
  IdentityFile /keys/common.id_rsa

Host vm_ubuntu2004
  Hostname 192.168.100.3
  User ubuntu
  IdentityFile /keys/common.id_rsa

Host vm_ubuntu2204
  Hostname 192.168.100.4
  User ubuntu
  IdentityFile /keys/common.id_rsa

Host vm_rocky88
  Hostname 192.168.100.10
  User rocky
  IdentityFile /keys/vm_rocky88.id_rsa
```
