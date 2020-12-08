## 查看系统信息
* uname -a
* cat /etc/redhat-release

## 查看服务状态
* systemctl status docker.service
* journalctl -xe
* systemctl status kubelet
* journalctl -xeu kubelet

## 挂载文件系统
* mount /dev/vdb1 /data
* mount -o remount,rw /
* /etc/fstab 中配置

## 查看磁盘情况
* 查看磁盘：fdisk -l
* 查看挂载：df -h
* 显示磁盘空间的使用情况：du -sh