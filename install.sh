#!/bin/sh
set -euo pipefail

SYSTEMD_DIR=/etc/systemd/system
SYSCONFIG_DIR=/etc/sysconfig
SELINUX_SRC_DIR=/etc/selinux/src

echo "Installing openvas-docker systemd service..."

cp openvas-docker.service ${SYSTEMD_DIR}/
if [ ! -e ${SYSCONFIG_DIR}/openvas-docker ]; then
	cp openvas-docker ${SYSCONFIG_DIR}/
	chmod 0600 ${SYSCONFIG_DIR}/openvas-docker
fi
/usr/bin/systemctl daemon-reload

if [ -x /usr/sbin/sestatus ]; then
	if ( /usr/sbin/sestatus | grep -q 'SELinux status:\s\+enabled'); then
		/usr/bin/dnf install -y udica
		mkdir -p ${SELINUX_SRC_DIR}
		cp openvas-docker.cil ${SELINUX_SRC_DIR}
		/usr/sbin/semodule -i ${SELINUX_SRC_DIR}/openvas-docker.cil /usr/share/udica/templates/{base_container.cil,net_container.cil}
	fi
fi

echo "Systemd service openvas-docker installed"
echo "Start service as follows:"
echo
echo "	systemctl start openvas-docker.service"
echo
