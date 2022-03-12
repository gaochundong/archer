
```bash
# 生成 SSH 公私钥
cd ~/
ssh-keygen -o -t rsa -C "hello@world.com" -b 4096

# 若需要指定目录生成
ssh-keygen -o -t rsa -C "hello@world.com" -b 4096 -f ./github/id_rsa

ls ~/.ssh
more id_rsa.pub
```
