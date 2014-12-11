#!/bin/bash


SALT_BOOTSTRAP="https://raw.githubusercontent.com/saltstack/salt-bootstrap/stable/bootstrap-salt.sh"

function install_salt {

	SALT_CALL=`which salt-call`
	if [ -z "${SALT_CALL}" ]
	then
		wget -O install_salt.sh https://bootstrap.saltstack.com
		sudo sh install_salt.sh -X
	fi
}

install_salt
sudo salt-call --file-root=salt/states --local --log-level=debug state.highstate
