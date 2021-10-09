auto br0
iface br0 inet dhcp  # 网桥使用DHCP模式，从DHCP服务器获取IP
bridge_ports enp1s0  # 网卡名称，网桥创建前连接外部的网卡，可通过ifconfig命令查看，有IP地址的就是
bridge_stp on  # 避免数据链路出现死循环
bridge_fd 0  # 将转发延迟设置为0


## KVM安装
### 配置确认
```
确认服务器的硬件是否支持虚拟化
egrep -c '(vmx|svm)' /proc/cpuinfo
grep -Eoc '(vmx|svm)' /proc/cpuinfo
```

### 检查BIOS中是否启用了VT
```
sudo apt install cpu-checker
kvm-ok
```

### 安装KVM
```
安装KVM及依赖项：
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager
```

```
将用户添加到“libvirt”和“kvm”组中
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
```

```
启动libvirtd服务，并设置开机自启动
sudo systemctl start libvirtd.service
sudo systemctl enable libvirtd.service
```

```
查看libvirtd服务状态
service libvirtd status
```

## 创建虚拟机
```
sudo virt-install --name=centos7.0 --description="centos7.0" \
--memory=10240,maxmemory=10240 \
--vcpus=10,maxvcpus=10 --hvm --cpu=host \
--os-type=linux --os-variant=centos7.0 \
--disk path=/var/lib/libvirt/images/centos7.img,bus=virtio,size=60 \
--network network=br0 \
--cdrom=/home/xrksudy/Desktop/CentOS-7.iso
```

```
sudo virt-install --name=centos7.0-2 --description="centos7.0-2" \
--memory=10240,maxmemory=10240 \
--vcpus=10,maxvcpus=10 --hvm --cpu=host \
--os-type=linux --os-variant=centos7.0 \
--disk path=/var/lib/libvirt/images/centos7-2.img,bus=virtio,size=60 \
--network network=br0 \
--cdrom=/home/xrksudy/Desktop/CentOS-7.iso
```

```
sudo virt-install --name=centos7.0-3 --description="centos7.0-2" \
--memory=10240,maxmemory=10240 \
--vcpus=10,maxvcpus=10 --hvm --cpu=host \
--os-type=linux --os-variant=centos7.0 \
--disk path=/var/lib/libvirt/images/centos7-3.img,bus=virtio,size=60 \
--network network=br0 \
--cdrom=/home/xrksudy/Desktop/CentOS-7.iso
```

# virt-install --name MyFedora --memory 1024 --disk path=/tmp/myFedora.img,size=10 --network network=br0 --os-variant fedora28 --cdrom /home/demo/Downloads/Fedora-Server-dvd-x86_64-29-1.2.iso 

## 查看网络桥接
```
brctl show
```
### NAT 模式
* NAT 会创建一个专有的虚拟网络，NAT 内部可以连接外部网络，但是外部计算机无法访问到虚拟机
* ”virbr0“网桥未添加任何物理接口。”virbr0-nic“是虚拟设备，没有流量通过该虚拟设备。该设备的唯一目的是避免更改“virbr0”网桥的MAC地址。
### Bridge 
* Bridge方式即虚拟网桥的网络连接方式，是客户机和子网里面的机器能够互相通信。可以使虚拟机成为网络中具有独立IP的主机。
* 
## get ip address
```
virsh domifaddr vm1
ssh-copy-id rkamradt@192.168.122.95 # use ip address from previous step
arp -e
```

## 磁盘管理
### 磁盘扩容
```
sudo qemu-img info winxp.qcow2
sudo qemu-img resize winxp.qcow2 +5G
进入系统，新建分区或通过工具，把新增加的磁盘空间和并到现有分区。
```

## 管理工具
* 开启虚拟机：virsh start [vm-sample]
* 关闭虚拟机：virsh shutdown [vm-sample]
* 挂起虚拟机：virsh suspend [vm-sample]
* 恢复虚拟机：virsh resume [vm-sample]
* 摧毁虚拟机：virsh undefine [vm-sample]
* 查看虚拟机信息：virsh dominfo [vm-sample]
* 软重启虚拟机：virsh reboot [vm-sample]
* 硬重启虚拟机：virsh reset [vm-sample]
* 设置虚拟机随着宿主主机开机自动启动：virsh autostart [vm-sample]
* 禁止虚拟机开机启动: virsh autostart --disable [vm-sample]
* 编辑虚拟机配置文件：virsh edit [vm-sample]
* 克隆虚拟机(虚拟机处于关闭或者挂起状态): virt-clone --original=[vm-sample] --name=[clone-vm-sample] --file=[disk local store]
* 创建磁盘： qemu-img create -f qcow2 xxxx.qcow2 10G
* 
 

## 教程参考
* https://www.codenong.com/cs105288290/
* KVM—跨主机通信: https://segmentfault.com/a/1190000040613345