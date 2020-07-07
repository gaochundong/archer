# redis commands

## 连接Redis查询数据

```bash
redis-cli -h 1.1.1.1 -p 6379 --verbose --no-auth-warning
redis-cli -h 1.1.1.1 -p 6379 --verbose --no-auth-warning
redis-cli -h 1.1.1.1 -p 6379 --verbose --no-auth-warning -c
redis-cli -h 1.1.1.1 -p 6379 --scan --pattern "xxxx.*"
redis-cli -h 1.1.1.1 -p 6379 --scan --pattern "xxxx.*" | xargs -L 1 redis-cli -h 1.1.1.1 -p 6379 DEL
```
