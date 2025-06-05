# 创建DB并为User授权使用

```text
安装
brew install mysql@8.0
修改 .zshrc
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
启动服务
brew services start mysql@8.0

安装后
mysql -u root

show databases;
use mysql;
show tables;
select user, host, plugin, authentication_string from user;

创建用户
CREATE USER IF NOT EXISTS 'chundong'@'%' IDENTIFIED WITH mysql_native_password BY '123456';

创建数据库
create database chundong default character set utf8mb4 collate utf8mb4_unicode_ci;
show databases;

use chundong;
show tables;

分配权限
GRANT ALL PRIVILEGES ON `chundong`.* TO `chundong`@`%`;
show grants for 'chundong';
REVOKE ALL PRIVILEGES ON `chundong`.* FROM `chundong`@`%`;
show grants for 'chundong';

生效权限
FLUSH PRIVILEGES;

status;
select version();
show variables like '%version%';

use chundong;
show tables;

exit
```
