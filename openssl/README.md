# openssl commands

## 生成公私钥对

```bash
openssl genrsa -des3 -out xxxxx_private.pem 2048
openssl rsa -in xxxxx_private.pem -outform PEM -pubout -out xxxxx_public.pem
openssl pkcs8 -topk8 -inform PEM -outform PEM -nocrypt -in xxxxx_private.pem -out xxxxx_private_pkcs8.pem

```
