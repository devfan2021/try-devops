

## 常用SQL命令

### 系统维护
* SHOW VARIABLES LIKE 'skip_networking'
* SELECT USER(), CURRENT_USER()
* SELECT user, host FROM mysql.user

## 问题列表
* [ERROR 1045 (28000): Access denied for user](https://stackoverflow.com/questions/10299148/mysql-error-1045-28000-access-denied-for-user-billlocalhost-using-passw)
```
You probably have an anonymous user ''@'localhost' or ''@'127.0.0.1'.
```