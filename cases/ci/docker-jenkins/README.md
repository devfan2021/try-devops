1.运行 docker logs -f jenkins 查看Jenkins日志。找到Jenkins Initial Password的日志
2.$docker ps
  进入容器内部,查看目录文件密码：
  $docker exec -i -t ebdc4dc22667 bash
  $cat /var/jenkins_home/secrets/initialAdminPassword
3.password:  6c898242c342409588519fd0d9ab9d18
4.node.js 安装
  * https://wdd.js.org/yarn-jenkins-ci-tutorial.html
  * https://lequ7.com/2019/07/02/javascript/wei-xin-xiao-cheng-xu-de-jenkins-fa-bu-gou-jian/
  * https://www.phpsong.com/3394.html