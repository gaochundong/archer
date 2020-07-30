# Linux挂载磁盘

## 挂载磁盘

```bash
lsblk
sudo mkdir /data1
sudo mkfs -t ext4 /dev/nvme1n1
sudo mount /dev/nvme1n1 /data1
df -khT
```

## 卸载磁盘

```bash
sudo umount -d /dev/nvme1n1
sudo mkfs -t ext4 /dev/nvme1n1
```

## 重启后自动挂载磁盘

```bash
sudo cp /etc/fstab /etc/fstab.bak.20200730
sudo blkid
sudo lsblk -o +UUID
sudo vim /etc/fstab
sudo umount /data1
sudo lsblk -o +UUID
sudo mount -a
sudo lsblk -o +UUID
```
