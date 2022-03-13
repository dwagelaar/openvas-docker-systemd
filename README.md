# openvas-docker-systemd
Systemd service for OpenVAS docker container on Fedora. Based on https://github.com/mikesplain/openvas-docker.

## Installing
```
sudo sh install.sh
```

## Uninstalling
```
sudo sh uninstall.sh
```

## Usage
- Set a secure password in `/etc/sysconfig/openvas-docker`
- Start as follows:
```
sudo systemctl start openvas-docker
```
- Navigate to https://localhost/ in your browser, and add an exception for the self-signed certificate
- Log in with username `admin` and the password you've set in `/etc/sysconfig/openvas-docker`
