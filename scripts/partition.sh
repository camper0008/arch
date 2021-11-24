
$FDISKDISPLAYMATCH="                       \
\'{                                        \
    isDisk=gsub(/^Disk \/.*$/, "\n"$0);    \
    isInfo=gsub(/^(Device|\/).*$/, $0);    \
    if (isDisk==1) {                       \
        print $0                           \
    }                                      \
    if (isInfo==1) {                       \
        print $0                           \
    }                                      \
}\'                                        \
"          

echo "Input device to partition (ex. /dev/sda)"
fdisk -l | awk $FDISKDISPLAYMATCH
read DEVICE

cat <<EOF | fdisk /dev/$DEVICE
d       # wipe existing partitions
d       # wipe existing partitions
d       # wipe existing partitions
d       # wipe existing partitions
g       # new partition label
n       # EFI
        # pick default option
        # pick default option
+550M   # 550M space
n       # swap
        # pick default option
        # pick default option
+2G     # 2G space
n       # filesystem
        # pick default option
        # pick default option
        # pick default option
t       # change type
1       # 1st partition
1       # to EFI
t       # change type
2       # 2nd partition
19      # to SWAP
w       # write new partitions 
EOF

mkfs.fat -F32 "${DEVICE}1"
mkswap "${DEVICE}2"
swapon "${DEVICE}2"
mkfs.ext4 "${DEVICE}3"

mount "/dev/${DEVICE}3" /mnt # mount partition 3 > /mnt
pacstrap /mnt base linux linux-firmware # install core into /mnt
genfstab -U /mnt >> /mnt/etc/fstab # generate file system table
arch-chroot /mnt