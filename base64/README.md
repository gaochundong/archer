
```bash
# 解码Base64字符串，二进制转十六进制可视化
echo Gh0KGwoTCP//////////fxDmpIepyJToAhIAGgAiAA== | base64 --decode | od -A n -t x1 | sed 's/^ *//'
```

