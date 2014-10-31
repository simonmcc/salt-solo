
dropbox_repo:
  pkgrepo.managed:
    - name: deb http://linux.dropbox.com/ubuntu precise main 
    - keyid: 5044912E
    - keyserver: pgp.mit.edu
    - file: /etc/apt/sources.list.d/dropbox.list
    - require_in:
      pkg: dropbox

dropbox:
  pkg.installed    

python-gpgme:
  pkg.installed
# dropbox start -i
# echo "fs.inotify.max_user_watches=100000" | sudo tee -a /etc/sysctl.conf ; sudo sysctl -p
