#!/bin/bash


SALT_BOOTSTRAP="https://raw.githubusercontent.com/saltstack/salt-bootstrap/stable/bootstrap-salt.sh"

function install_salt {

	SALT_CALL=`which salt-call`
	if [ -z "${SALT_CALL}" ]
	then
		wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -
		wget -O install_salt.sh https://bootstrap.saltstack.com
		sudo -E sh install_salt.sh -X
	fi
}

install_salt
sudo -E salt-call --file-root=salt/states --local --log-level=debug state.highstate
