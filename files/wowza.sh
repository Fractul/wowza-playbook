#!/bin/sh
wowza_version=4.5.0

distro=$(lsb_release -si)
case "$distro" in
 "Ubuntu" | "Debian" | "LinuxMint" ) sudo apt-get -y install expect curl;;
 "Fedora" ) sudo dnf -y install expect curl;;
 "CentOS" | "RedHatEnterpriseServer" ) sudo yum -y install expect curl;;
esac

wget -O /root/wowza.run https://www.wowza.com/downloads/WowzaStreamingEngine-4-5-0/WowzaStreamingEngine-4.5.0-linux-x64-installer.run && chmod 755 wowza.run && chmod +x /root/wowza.run
if [[ ! -f wowza.exp ]]
then curl https://github.com/Fractul/wowza-playbook/blob/master/files/wowza.exp
fi
chmod 755 wowza.exp && ./wowza.exp
