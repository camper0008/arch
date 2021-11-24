FDISKDISPLAYMATCH="{ isDisk=gsub(/^Disk \/.*$/, "\n"\$0); if (isDisk==1) { print \$0 }; isInfo=gsub(/^(Device|\/).*$/, \$0); if (isInfo==1) { print \"  \",\$0 }; }"          
echo "Input device to partition (ex. /dev/sda)\n"; echo
fdisk -l | awk "$FDISKDISPLAYMATCH"
echo; echo "Device name (ex. /dev/sda):"
read DEVICE

cat <<EOF | fdisk $DEVICE
d

y
d

y
d

y
d

y
g
n


+550M
n


+2G
n



t
1
1
t
2
19
w
y
EOF

mkfs.fat -F32 "${DEVICE}1"
mkswap "${DEVICE}2"
swapon "${DEVICE}2"
mkfs.ext4 "${DEVICE}3"

mount "${DEVICE}3" /mnt # mount partition 3 > /mnt
pacstrap /mnt base linux linux-firmware # install core into /mnt
genfstab -U /mnt >> /mnt/etc/fstab # generate file system table
arch-chroot /mnt