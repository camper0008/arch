# Quick guide for initial setup

## Load keys

```bash
loadkeys dk-latin1
```

## Internet

```bash
iwctl device list
iwctl station <DEVICE> scan
iwctl station <DEVICE> get-networks
iwctl station <DEVICE> connect <SSID>
```


## Partition disks

```bash
fdisk -l # show all disks
fdisk <DEVICE> # fdisk into device
```

```bash
d # repeat until partitions are deleted
g # new partition label

n # EFI
<ENTER> # pick default option
<ENTER> # pick default option
+550M # 550M space

n # swap
<ENTER> # pick default option
<ENTER> # pick default option
+2G # 2G space

n # filesystem
<ENTER> # pick default option
<ENTER> # pick default option
<ENTER> # pick default option

t  # change type
1  # 1st partition
1  # to EFI
t  # change type
2  # 2nd partition
19 # to SWAP

w # write new partitions 
```

```bash
mkfs.fat -F32 <DEVICE>1
mkswap <DEVICE>2
swapon <DEVICE>2
mkfs.ext4 <DEVICE>3 
```

```bash
mount /dev/<DEVICE>3 /mnt # mount partition 3 > /mnt
pacstrap /mnt base linux linux-firmware # install core into /mnt
genfstab -U /mnt >> /mnt/etc/fstab # generate file system table
arch-chroot /mnt
```