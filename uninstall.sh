#!/bin/sh
set -euo pipefail

SYSTEMD_DIR=/etc/systemd/system

echo "Uninstalling systemd service openvas-docker..."

/usr/bin/systemctl stop openvas-docker.service
rm ${SYSTEMD_DIR}/openvas-docker.service
/usr/bin/systemctl daemon-reload

if [ -x /usr/sbin/sestatus ]; then
	if ( /usr/sbin/sestatus | grep -q 'SELinux status:\s\+enabled'); then
		/usr/sbin/semodule -r openvas-docker
	fi
fi

echo "Systemd service openvas-docker uninstalled"
