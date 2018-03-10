# install rasbian
# https://www.raspberrypi.org/documentation/installation/installing-images/mac.md
diskutil list
---
/dev/disk2

/dev/disk2 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *31.9 GB    disk2
   1:             Windows_FAT_32 boot                    43.8 MB    disk2s1
   2:                      Linux                         7.7 GB     disk2s2
---

diskutil unmountDisk /dev/disk2
---
Unmount of all volumes on disk2 was successful
---

# copy data
sudo dd bs=1m if=2017-11-29-raspbian-stretch-lite.img of=/dev/rdisk2 conv=sync
---
yoovrajs-MacBook-Pro:softwares yoovrajshinde$ sudo dd bs=1m if=2017-11-29-raspbian-stretch-lite.img of=/dev/rdisk2 conv=sync
1772+0 records in
1772+0 records out
1858076672 bytes transferred in 142.557784 secs (13033849 bytes/sec)
---

sudo diskutil eject /dev/rdisk2

>> done

--------
# need external keyboard atleast
# connect and check ip address
# enable ssh
raspi-config
---
enable ssh
---



# login raspberry pi
ssh  169.254.37.181 -lpi

# Find available WiFi adapters – WiFi network from command line
iw dev
---
phy#0
	Unnamed/non-netdev interface
		wdev 0x2
		addr ba:27:eb:c3:30:13
		type P2P-device
		txpower 31.00 dBm
	Interface wlan0
		ifindex 3
		wdev 0x1
		addr b8:27:eb:c3:30:13
		type managed
		channel 1 (2412 MHz), width: 20 MHz, center1: 2412 MHz
		txpower 31.00 dBm
---

# Check device status – WiFi network from command line
ip link show wlan0
---
3: wlan0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast state DOWN mode DORMANT group default qlen 1000
    link/ether b8:27:eb:c3:30:13 brd ff:ff:ff:ff:ff:ff
---
# it is DOWN

# Bring up the WiFi interface – WiFi network from command line
sudo ip link set wlan0 up



iw wlan0 link

# Scan to find WiFi Network – WiFi network from command line
iw wlan0 scan




####### Coova chilli install preparation
mkdir -pv ~/work/back/
cp -v /etc/network/interfaces ~/work/back/
vi /etc/network/interfaces
--------
# interfaces(5) file used by ifup(8) and ifdown(8)

# Please note that this file is written to be used with dhcpcd
# For static IP, consult /etc/dhcpcd.conf and 'man dhcpcd.conf'

# Include files from /etc/network/interfaces.d:
source-directory /etc/network/interfaces.d

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
#auto wlan0
#allow-hotplug wlan0
#iface wlan0 inet manual
# wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

#iface default inet dhcp

allow-hotplug wlan0
iface wlan0 inet static
 address 192.168.10.1
 netmask 255.255.255.0
 network 192.168.10.0
--------
