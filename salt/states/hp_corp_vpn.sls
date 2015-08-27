
# apt-get install network-manager-openvpn-gnome
network-manager-openvpn-gnome:
  pkg.installed

/opt/hp-corp:
  file.directory


/opt/hp-corp/hp-corp.ovpn:
  file.managed:
    - source: salt://hp-corp.ovpn
