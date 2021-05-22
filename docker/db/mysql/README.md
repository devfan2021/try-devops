## 常用SQL命令

### 系统维护
* SHOW VARIABLES LIKE 'skip_networking'
* SELECT USER(), CURRENT_USER()
* SELECT user, host FROM mysql.user
* mysql -h 远程服务器地址 –u用户名 –p密码 –D数据库<sql脚本文件路径
示例：mysql -h 192.168.1.1 -u test -P 3306 -p123456 -Dtest</data/test/filename

## 问题列表
* [ERROR 1045 (28000): Access denied for user](https://stackoverflow.com/questions/10299148/mysql-error-1045-28000-access-denied-for-user-billlocalhost-using-passw)
```
You probably have an anonymous user ''@'localhost' or ''@'127.0.0.1'.
```