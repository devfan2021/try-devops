## 用户认证模块
* 默认情况下nginx已经安装了ngx_http_auth_basic_module模块
* 安装密码生成工具：yum install httpd-tools -y
* 配置文件如下：
```python
location /mysql/ {
    auth_basic   "登录认证";  
    auth_basic_user_file /usr/local/nginx/conf/custom-pass-file;
    #access_log  /var/log/nginx/access-mysql.log  main;
    proxy_pass http://xxx.xxx.xxx:8001/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_next_upstream error timeout invalid_header http_502 http_503 http_504;
}
```
* 创建用户密码 sudo htpasswd -c /usr/local/nginx/conf/custom-pass-file-elk xrksudylab-elk


## 代理请求测试
* curl --proxy xxx.xxx.xxx.xxx:443 http://xrksudy-test.jryzt.com/xrksudylab9running/gettypes

## 正向代理patch，支持https
https://github.com/chobits/ngx_http_proxy_connect_module