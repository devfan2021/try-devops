## Enable SSH
* sudo apt install openssh-server
* sudo systemctl status ssh
* sudo ufw allow ssh
### [apt-get dependency issue Open-SSH Server](https://askubuntu.com/questions/603493/apt-get-dependency-issue-open-ssh-client) 
* sudo apt-get remove openssh-server openssh-client --purge && sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get update
* sudo apt-get install openssh-server openssh-client

## Install network tool
* sudo apt install net-tools
* ip a

## Identifying the Network Management System
```
networkctl status
systemctl status systemd-resolved.service
```

## the domain TTL's you can use dig from dns-utils
```
apt install dnsutils
dig askubuntu.com
```


## osinfo-query
```
sudo apt install libosinfo-bin
```
