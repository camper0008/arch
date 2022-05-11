# audio

## groups

if audio does not work, make sure you are in appropiate sound groups in addition to wheel

you only need to do pulse-related steps if you are using pulse

```
# groupadd pulse
# useradd -aG sound pulse pieter
```

## aplay -l

if `aplay -l` cannot find any sound devices you should try the following

installing alsa-firmware, sof-firmware, alsa-ucm-conf
```
# pacman -S alsa-firmware sof-firmware, alsa-ucm-conf
```
though in my experience you only need to install sof-firmware and then reboot

https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture#ALSA_firmware

restart pulseaudio
```
$ pulseaudio -k
$ pulseaudio --start
```
or as a service
```
# pulseaudio --user enable pulseaudio
# pulseaudio --user restart pulseaudio
```
