## Archived
This repository is no longer maintained and has been archived.

# openvas-docker-systemd

Systemd service for OpenVAS docker container on Fedora. Based on https://github.com/mikesplain/openvas-docker. Includes an SELinux policy created with [Udica](https://fedoramagazine.org/use-udica-to-build-selinux-policy-for-containers/) so that the service can run with SELinux enabled and enforcing.

## Installing

```bash
sudo sh install.sh
```

## Uninstalling

```bash
sudo sh uninstall.sh
```

## Usage

- Set a secure password in `/etc/sysconfig/openvas-docker`
- Start as follows:

  ```bash
  sudo systemctl start openvas-docker
  ```

- Navigate to https://localhost/ in your browser, and add an exception for the self-signed certificate
- Log in with username `admin` and the password you've set in `/etc/sysconfig/openvas-docker`
