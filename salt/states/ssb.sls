# Create some custom Chrom Apps
# (Site Specific Browsers)
#
# Create a PNG from a favicon.ico
# convert Evernote.ico[2] -alpha on -background none -flatten ~/Desktop/Evernote.png


/home/mccartsi/.icons:
  file.directory

{% set apps = ["JIRA", "Evernote"] %}
{% for app in apps %}
  {% set app_desktop = app+'.desktop' %}
  {% set app_icon = app+'.png' %}
/home/mccartsi/Desktop/{{ app_desktop }}:
  file.managed:
    - mode: 755
    - owner: mccartsi
    - source: salt://ssb/{{ app_desktop }}

/home/mccartsi/.icons/{{ app_icon }}:
  file.managed:
    - mode: 755
    - owner: mccartsi
    - source: salt://ssb/{{ app_icon }}
{% endfor %}
