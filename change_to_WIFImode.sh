#/etc/network/interfaces config
sudo sed -i 's/#    wpa-conf \/etc\/wpa_supplicant\/wpa_supplicant.conf/    wpa-conf \/etc\/wpa_supplicant\/wpa_supplicant.conf/g' /etc/network/interfaces
sudo sed -i 's/iface wlan0 inet static/iface wlan0 inet manual/g' /etc/network/interfaces
sudo sed -i 's/address 192.168.0.1/#address 192.168.0.1/g' /etc/network/interfaces
sudo sed -i 's/netmask 255.255.255.0/#netmask 255.255.255.0/g' /etc/network/interfaces
sudo sed -i 's/network 192.168.0.0/#network 192.168.0.0/g' /etc/network/interfaces
sudo sed -i 's/broadcast 192.168.0.255/#broadcast 192.168.0.255/g' /etc/network/interfaces

#ip forward config
sudo sed -i 's/net.ipv4.ip_forward=1/#net.ipv4.ip_forward=1/g' /etc/sysctl.conf

#/etc/rc.local iptables service config
sudo sed -i 's/sudo iptables -F/#sudo iptables -F/g' /etc/rc.local
sudo sed -i 's/sudo iptables -F -t nat/#sudo iptables -F -t nat/g' /etc/rc.local
sudo sed -i 's/sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE/#sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE/g' /etc/rc.local
sudo sed -i 's/sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEP/#sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEP/g' /etc/rc.local
sudo sed -i 's/sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT/#sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT/g' /etc/rc.local
sudo sed -i 's/service dnsmasq start/#service dnsmasq start/g' /etc/rc.local
sudo sed -i 's/service hostapd start/#service hostapd start/g' /etc/rc.local
sudo sed -i 's/#service dnsmasq stop/service dnsmasq stop/g' /etc/rc.local
sudo sed -i 's/#service hostapd stop/service hostapd stop/g' /etc/rc.local
sudo sed -i 's/#sleep 3/sleep 3/g' /etc/rc.local
sudo sed -i 's/#ifdown wlan0/ifdown wlan0/g' /etc/rc.local
sudo sed -i 's/#ifup waln0/ifup waln0/g' /etc/rc.local

sudo iptables -F

sudo reboot
