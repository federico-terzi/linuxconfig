# Using DD to clone a disk with partitions

Find the correct disk using *fdisk*

```
sudo fdisk -l
```

Then you can use DD to clone the content to a file

```
sudo dd if=/dev/sda of=/path/to/output.img bs=4M status=progress
```
