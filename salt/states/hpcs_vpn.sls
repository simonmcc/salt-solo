# install the hpcs vpn tools
#
# see the README for more details
#

'python-elementtidy':
  pkg.installed

'libc6:i386':
  pkg.installed

'zlib1g:i386':
  pkg.installed

    # chown root:root ncui ncsvc
    # chmod 4755 ncui ncsvc

/opt/hpcs_vpn:
  file.recurse:
    - source: salt://hpcs_vpn/
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

{% set scripts = ["/opt/hpcs_vpn/hpcs_certupdate.sh",
                  "/opt/hpcs_vpn/hpcs_auto.sh",
                  "/opt/hpcs_vpn/hpcs_useast.sh",
                  "/opt/hpcs_vpn/hpcs_uswest.sh"] %}
{% for script in scripts %}
{{ script }}:
  file.managed:
    - replace: False
    - mode: 4755
    - require:
      - file: /opt/hpcs_vpn
{% endfor %}

# chown root:root ncui ncsvc
# chmod 4755 ncui ncsvc

{% set binaries = ["/opt/hpcs_vpn/ncui", "/opt/hpcs_vpn/ncsvc"] %}
{% for binary in binaries %}
{{ binary }}:
  file.managed:
    - replace: False
    - user: root
    - group: root
    - mode: 4755
    - require:
      - file: /opt/hpcs_vpn
{% endfor %}
