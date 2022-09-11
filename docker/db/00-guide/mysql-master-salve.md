[Linux安装Mysql8.0.20并配置主从复制（一主一从，双主双从）](https://www.cnblogs.com/cao-lei/p/13603043.html)
[MySQL8.0.16主从环境搭建（CentOS7）](https://www.cnblogs.com/LUA123/p/10776394.html)

https://www.cnblogs.com/cao-lei/p/15406724.html  =>(SpringBoot + LibreOffice + Hutool 实现附件预览简单示例)

端口：9006

[Server] A temporary password is generated for root@localhost: <;eBa:JSy7zP

dEO?oZs-0kyO


ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'QWer1234!@';

alter user 'root'@'%' identified with mysql_native_password by 'QWer1234!@';

alter user 'root'@'localhost' identified with mysql_native_password by 'QWer1234!@';

create user 'slave'@'%' identified with mysql_native_password by 'QWer1234!@';


ALTER USER 'slave'@'%' IDENTIFIED WITH mysql_native_password BY 'QWer1234!@';



GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'QWer1234!@' WITH GRANT OPTION;


mysql -uroot -p -h47.100.75.46 -P9006
mysql -uslave -p -h47.100.75.46 -P9006

mysql -uroot -p -h106.13.16.115 -P9006

change master to master_host='47.100.75.46',master_port=9006,master_user='slave',master_password='QWer1234!@',master_log_file='mysql-bin.000003',master_log_pos=1103;


create database confluence CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
create user 'confluence'@'%' identified with mysql_native_password by 'QWer1234!@';

GRANT ALL PRIVILEGES ON confluence.* TO 'confluence'@'%' IDENTIFIED BY 'QWer1234!@' WITH GRANT OPTION;


grant all on confluence.* to 'confluence'@'%' identified by 'QWer1234!@';


GRANT ALL PRIVILEGES ON confluence.* TO 'confluence'@'%';
flush privileges;

