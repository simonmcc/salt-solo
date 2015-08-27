#!/bin/bash


SALT_BOOTSTRAP="https://raw.githubusercontent.com/saltstack/salt-bootstrap/stable/bootstrap-salt.sh"
THISSCRIPT=${BASH_SOURCE[0]:-$0}
# find the ps-dev directory based on where
SALT_SOLO_ROOT="$( cd "$( dirname "${THISSCRIPT}" )" && pwd )"

if [ -d /vagrant ]
then
  FILE_ROOT="/vagrant/salt/states"
else
  FILE_ROOT="${SALT_SOLO_ROOT}/salt/states"
fi

function install_salt {

SALT_CALL=$(which salt-call)
	if [ -z "${SALT_CALL}" ]
	then
		sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B9316A7BC7917B12
		wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -
		INSTALL_SALT_SH="/tmp/${$}-install_salt.sh"
		wget -O ${INSTALL_SALT_SH} ${SALT_BOOTSTRAP}
		sudo -E sh ${INSTALL_SALT_SH} -X -P
	fi
}

install_salt
echo "Running salt-call against ${FILE_ROOT}"
sudo -E salt-call --file-root="${FILE_ROOT}" --local --log-level=debug state.highstate
