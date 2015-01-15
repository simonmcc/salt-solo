
virtualbox_repo:
  pkgrepo.managed:
    - name: deb http://download.virtualbox.org/virtualbox/debian trusty contrib
    - file: /etc/apt/sources.list.d/virtualbox.list
    - key_url:  https://www.virtualbox.org/download/oracle_vbox.asc
    - require_in:
      pkg: virtualbox virtualbox-dkms

virtualbox:
  pkg.installed

"virtualbox-dkms":
  pkg.installed
