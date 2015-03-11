
# apt-get install network-manager-openvpn-gnome
network-manager-openvpn-gnome:
  pkg.installed

/tmp/hp-corp.ovpn:
  file.managed:
    - source: salt://hp-corp.ovpn
