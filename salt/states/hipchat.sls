
hipchat_repo:
  pkgrepo.managed:
    - name: deb http://downloads.hipchat.com/linux/apt stable main
    - key_url: https://www.hipchat.com/keys/hipchat-linux.key
    - file: /etc/apt/sources.list.d/atlassian-hipchat.list

hipchat:
  pkg.installed    
