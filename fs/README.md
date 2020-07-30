# 挂载磁盘

```bash
lsblk
sudo mkdir /data1
sudo mkfs -t ext4 /dev/nvme1n1
sudo mount /dev/nvme1n1 /data1
df -kh

sudo umount -d /dev/nvme1n1
sudo mkfs -t ext4 /dev/nvme1n1
```
