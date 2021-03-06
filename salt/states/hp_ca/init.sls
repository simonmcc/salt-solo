# Install the HP CA
#

/usr/share/ca-certificates/hpca2ssG2_ns.crt:
  file.managed:
    #  https://digitalbadge.corp.hp.com/hp/CAs/hpca2ssG2_ns.crt
    - source: salt://hp_ca/hpca2ssG2_ns.crt
    - mode: 644
    - replace: False
    - user: root
    - group: root

# Update /etc/ca-certificates
# Aye, salt has file.sed, but I can't make it work in this case
addhpcs2cacertifcates:
  cmd:
    - run
    - name: echo "hpca2ssG2_ns.crt" >> /etc/ca-certificates.conf
    - unless: grep ^hpca2ssG2_ns.crt /etc/ca-certificates.conf

# and regenerate /etc/ssl/certs/
update-ca-certificates:
  cmd.watch:
    - order: last
    - watch:
      - file: /usr/share/ca-certificates/hpca2ssG2_ns.crt
      - cmd: addhpcs2cacertifcates
