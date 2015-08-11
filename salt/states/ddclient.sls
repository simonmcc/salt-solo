# install & configure a Dynamic DNS client to publish
# the private IP address of this host

libio-socket-ssl-perl:
   pkg.installed

ddclient:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - pkg: ddclient
    - watch:
      - file: /etc/ddclient.conf

/etc/ddclient.conf:
  file:
    - managed
    - contents: |
        # Configuration file for ddclient generated salt-solo
        #
        # /etc/ddclient.conf
        daemon=600
        # check every 600 seconds
        syslog=yes
        # log update msgs to syslog
        mail-failure=simon@mccartney.ie # Mail failed updates to user
        # record PID in file.
        pid=/var/run/ddclient.pid
        # where we get our IP from
        use=if
        if=eth0
        # DynDNS username and password here
        login=innroad
        password=dynmenow
        # Default options
        protocol=dyndns2
        server=members.dyndns.org
        # Dynamic DNS hosts
        {{ grains['nodename'] }}.selfip.net
        #mccartsi-eb9470.selfip.net
