
chrome_repo:
  pkgrepo.managed:
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - file: /etc/apt/sources.list.d/google-chrome.list

google-chrome-stable:
  pkg.installed    
