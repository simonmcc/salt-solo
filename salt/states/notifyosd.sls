# http://www.webupd8.org/2014/04/configurable-notification-bubbles-for.html

amandeepgrewal/notifyosdconfig:
  pkgrepo.managed:
    - ppa: amandeepgrewal/notifyosdconfig

libnotify-bin:
  pkg.installed:
    - require:
      - pkgrepo: amandeepgrewal/notifyosdconfig

leolik/leolik:
  pkgrepo.managed:
    - ppa: leolik/leolik

notifyosdconfig:
  pkg.installed:
    - require:
      - pkgrepo: leolik/leolik
      - pkg: libnotify-bin
