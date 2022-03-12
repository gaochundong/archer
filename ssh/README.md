
```bash

# 生成 SSH 公私钥，使用 RSA
cd ~/.ssh
ssh-keygen -o -t rsa -C "hello@world.com" -b 4096

# 若需要指定目录生成
cd ~/.ssh/github
ssh-keygen -o -t rsa -C "hello@world.com" -b 4096 -f ./github/id_rsa

# 可以关联到 .ssh 目录下
ln -sf github/id_rsa id_rsa
ln -sf github/id_rsa.pub id_rsa.pub

# github使用ed25519格式密钥，不设置密码，将 id_ed25519.pub 添加至 github 账号中
ssh-keygen -o -t ed25519 -C "hello@world.com" -b 4096 -f ./id_ed25519

# github密钥的默认权限
~/.ssh/github
-rw------- 1 hello 419 Mar 12 22:22 id_ed25519
-rw-r--r-- 1 hello 105 Mar 12 22:22 id_ed25519.pub

# 将github密钥增加至MacOS的KeyChain中，不使用 -K 密钥
ssh-add ~/.ssh/github/id_ed25519

# github需要使用ssh方式clone库
git clone git@github.com:gaochundong/archer.git

```
