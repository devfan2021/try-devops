## [How to Install Node.js and npm on CentOS 7](https://linuxize.com/post/how-to-install-node-js-on-centos-7/)
1. Add NodeSource yum repository
```
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
```
2. Install Node.js and npm 
```
sudo yum install nodejs
```
3. Verify the Node.js and npm Installation
```
node --version
npm --version
```