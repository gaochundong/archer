### 安装 clash 服务

```bash
# 参考 https://github.com/nelvko/clash-for-linux-install
# uname -m 查询系统架构，比如结果是 arch-arm64
git clone --branch arch-arm64 https://github.com/nelvko/clash-for-linux-install.git
cd clash-for-linux-install
sudo bash -c '. install.sh; exec bash'
```

### 查看 clash 命令

```bash
Usage:                                   
    clash                    命令一览    
    clashon                  开启代理    
    clashoff                 关闭代理    
    clashui                  面板地址    
    clashstatus              内核状况    
    clashtun     [on|off]    Tun 模式    
    clashmixin   [-e|-r]     Mixin 配置  
    clashsecret  [secret]    Web 密钥    
    clashupdate  [auto|log]  更新订阅
```

### 优雅启停

```bash
$ clashoff
😼 已关闭代理环境

$ clashon
😼 已开启代理环境

$ clashui

$ clashsecret 666
😼 密钥更新成功，已重启生效

$ clashsecret
😼 当前密钥：666
```

### 卸载

```bash
sudo bash -c '. uninstall.sh; exec bash'
```

### Tun 模式

```bash
$ clashtun
😾 Tun 状态：关闭

$ clashtun on
😼 Tun 模式已开启
```
