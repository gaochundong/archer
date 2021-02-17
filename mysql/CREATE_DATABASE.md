# 创建DB并为User授权使用

```text
show databases;
use mysql;
show tables;
select user, host, plugin, authentication_string from user;
create database chundong default character set utf8mb4 collate utf8mb4_unicode_ci;
show databases;
use chundong;
show tables;
GRANT ALL PRIVILEGES ON `chundong`.* TO `chundong`@`%`;
show grants for 'chundong';
REVOKE ALL PRIVILEGES ON `chundong`.* FROM `chundong`@`%`;
show grants for 'chundong';
status;
select version();
show variables like '%version%';
use chundong;
show tables;
exit
```
