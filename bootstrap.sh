#!/bin/bash


SALT_BOOTSTRAP="https://raw.githubusercontent.com/saltstack/salt-bootstrap/stable/bootstrap-salt.sh"

function install_salt {

	SALT_CALL=`which salt-call`
	if [ -z "${SALT_CALL}" ]
	then
		wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -
		INSTALL_SALT_SH="/tmp/$$-install_salt.sh"
		wget -O ${INSTALL_SALT_SH} ${SALT_BOOTSTRAP}
		sudo -E sh ${INSTALL_SALT_SH} -X -P
	fi
}

install_salt
if [ -d /vagrant ]
then
  FILE_ROOT="/vagrant/salt/states"
else
  FILE_ROOT="$(basename $0)/salt/states"
fi

echo "Running salt-call against ${FILE_ROOT}"
sudo -E salt-call --file-root=${FILE_ROOT} --local --log-level=debug state.highstate
