# Mounting disks

List the disks and partitions with `fdisk`

```
sudo fdisk -l
```

Then, when you found the correct partition ( usually in the
form of `/dev/sdXN` where X is a letter and N a number )
you can mount it using mount

```
# Create directory if it doesnt exist
sudo mkdir /mnt/dirname

sudo mount -t auto -v /dev/sda1 /mnt/dirname
```

### Unmounting

To unmount the disk, simply use:

```
sudo umount /dev/sda1
```

