echo ' ' | sudo -S wpa_supplicant -c /etc/wpa_supplicant/wpa_supplicant.conf -i wlo1 > /dev/null &
echo ' ' | sudo -S dhcpcd &
