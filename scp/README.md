# scp commands

## 传输文件

```bash
scp -i /tmp/key.pem -o 'IdentitiesOnly yes' /tmp/xxx.jar ubuntu@1.1.1.1:/tmp
scp /tmp/xxx.jar ubuntu@1.1.1.1:/tmp
```

## 传输目录

```bash
scp -r dist ubuntu@1.1.1.1:/tmp
```
