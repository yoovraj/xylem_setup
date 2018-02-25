https://www.blackmoreops.com/2014/09/18/connect-to-wifi-network-from-command-line-in-linux/

nmap -sP -PS22,3389 192.168.2.1/24 #custom TCP SYN scan

interface=wlan0
bridge=br0
driver=nl80211
country_code=UK
ssid=XYLEM_NETWORK
hw_mode=g
channel=6
auth_algs=1
wpa=2
wpa_passphrase=xylem
wpa_key_mgmt=WPA-PSK
#Wireless N Settings
ieee80211n=1
wmm_enabled=1




# interface wlan Wi-Fi
interface=wlan0
# nl80211 avec tous les drivers Linux mac80211
driver=nl80211
# Nom du spot Wi-Fi
ssid=PiHomeServerAP
# mode Wi-Fi (a = IEEE 802.11a, b = IEEE 802.11b, g = IEEE 802.1g)
hw_mode=g
# canal de fréquence Wi-Fi (1-14)
channel=6
# Wi-Fi ouvert, pas d'authentification !
auth_algs=1
# Beacon interval in kus (1.024 ms)
beacon_int=100
# DTIM (delivery traffic information message)
dtim_period=2
# Maximum number of stations allowed in station table max_num_sta=255
# RTS/CTS threshold; 2347 = disabled (default)
rts_threshold=2347
# Fragmentation threshold; 2346 = disabled (default)
fragm_threshold=2346






sudo ifup br0
sudo ifup br0
ifdown wlan0
ifdown eth1





auto lo
iface lo inet loopback

iface eth0 inet dhcp

allow-hotplug wlan0
iface wlan0 inet static
 address 192.168.10.1
 netmask 255.255.255.0
 network 192.168.10.0

iface default inet dhcp

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
service iptables -persistent save
sudo apt-get install -y iptables-persistent
OR
iptables-save >/etc/iptables/rules.v4
iptables-restore < /etc/iptables/rules.v4


update-rc.d hostapd enable update-rc.d isc-dhcp-server enable

iptables -I POSTROUTING -t nat -o $HS_WANIF -j MASQUERADE
