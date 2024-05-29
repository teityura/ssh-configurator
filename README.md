# ssh-configurator

## 1. edit roles/ssh/vars/main.yml

``` yml
---
ssh_hosts:
  - name: vm_alma94
    ip: 192.168.100.1
    user: almalinux

  - name: vm_alma89
    ip: 192.168.100.2
    user: almalinux

  - name: vm_ubuntu2004
    ip: 192.168.100.3
    user: ubuntu

  - name: vm_ubuntu2004
    ip: 192.168.100.4
    user: ubuntu
```

## 2. run setup_ssh.yml

``` log
ansible-playbook setup.yml
```

## 3. result

``` log
[root@adm ~]$ ls -l /keys/vm_*
-rw------- 1 root root 3357 May 30 02:21 /keys/vm_alma89.id_rsa
-rw------- 1 root root  726 May 30 02:21 /keys/vm_alma89.id_rsa.pub
-rw------- 1 root root 3357 May 30 02:21 /keys/vm_alma94.id_rsa
-rw------- 1 root root  726 May 30 02:21 /keys/vm_alma94.id_rsa.pub
-rw------- 1 root root 3357 May 30 02:21 /keys/vm_ubuntu2004.id_rsa
-rw------- 1 root root  726 May 30 02:21 /keys/vm_ubuntu2004.id_rsa.pub
-rw------- 1 root root 3357 May 30 02:30 /keys/vm_ubuntu2204.id_rsa
-rw------- 1 root root  726 May 30 02:30 /keys/vm_ubuntu2204.id_rsa.pub

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
  IdentityFile /keys/vm_alma89.id_rsa

Host vm_alma94
  Hostname 192.168.100.2
  User almalinux
  IdentityFile /keys/vm_alma94.id_rsa

Host vm_ubuntu2004
  Hostname 192.168.100.3
  User ubuntu
  IdentityFile /keys/vm_ubuntu2004.id_rsa

Host vm_ubuntu2204
  Hostname 192.168.100.4
  User ubuntu
  IdentityFile /keys/vm_ubuntu2204.id_rsa
```
