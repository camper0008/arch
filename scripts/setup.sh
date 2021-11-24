
# keyboard
clear
echo "Setting keyboard layout"
loadkeys dk-latin1

# timezone
clear
echo "Setting timezone"
ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime
hwclock --systohc

# locale
clear
echo "Generating locales"
awk '{ gsub(/#en_DK\.UTF-8 UTF-8/, "en_DK.UTF-8 UTF-8"); print }' /etc/locale.gen > /tmp/locale.gen.tmp
cat /tmp/locale.gen.tmp > /etc/locale.gen
rm /tmp/locale.gen.tmp
locale-gen

# hostname
clear
echo "Setting hostname"
echo "Enter hostname:"
read HOSTNAME
echo "$HOSTNAME" > /etc/hostname

echo "Setting hosts"
echo "\
127.0.0.1       localhost\n\
::1             localhost\n\
127.0.1.1       $HOSTNAME.localdomain   $HOSTNAME" > /etc/hosts

# user
clear
echo "Setting up user permissions"
echo "Add root password"
passwd
echo "Adding user"
echo "Enter username:"
read USERNAME
useradd -m $USERNAME
passwd $USERNAME

# user groups
clear
echo "Setting up user group"
usermod -aG wheel,audio,video,optical,storage $USERNAME
awk '{ gsub(/^# %wheel ALL=\(ALL\) ALL$/, "%wheel ALL=(ALL) ALL"); print }' /etc/sudoers > /tmp/sudoers.tmp
cat /tmp/sudoers.tmp > /etc/sudoers
rm /tmp/sudoers.tmp

# grub
clear
echo "Setting up grub"
pacman -S efibootmgr dosfstools os-prober mtools --noconfirm
clear
echo "Enter device you used for partitioning: (ex. /dev/sda)"
read DEVICE
mkdir /boot/EFI
mount "${DEVICE}1" /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

# install packages
clear
echo "Installing frequently used packages"
pacman -S networkmanager vim base-devel gcc git --noconfirm

# systemctl
clear
echo "Enabling networkmanager"
systemctl enable NetworkManager

# exit and unmount
clear
echo "Finished commands, unmounting..."
echo "To complete setup, run 'exit' followed by 'umount -l /mnt && reboot'"