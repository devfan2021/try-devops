## 查看系统信息
* uname -a
* cat /etc/redhat-release

## 查看服务状态
* systemctl status docker.service
* journalctl -xe
* systemctl status kubelet
* journalctl -xeu kubelet

## remove systemd service
* systemctl stop [servicename]
* systemctl disable [servicename]
* rm /etc/systemd/system/[servicename]
* rm /etc/systemd/system/[servicename] # and symlinks that might be related
* rm /usr/lib/systemd/system/[servicename]
* rm /usr/lib/systemd/system/[servicename] # and symlinks that might be related
* systemctl daemon-reload
* systemctl reset-failed

## 挂载文件系统
* mount /dev/vdb1 /data
* mount -o remount,rw /
* sudo blkid    ### 查看分区的UUID
* 在/etc/fstab 中配置分区信息

## 查看磁盘情况
* 查看磁盘：fdisk -l
* 查看挂载：df -h
* 显示磁盘空间的使用情况：du -sh

## check current shell
* ps -p $$  
* echo $0
