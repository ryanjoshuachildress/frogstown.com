apt update && apt upgrade -y && apt install git curl wget nfs-common -y && update && reboot

if lxc 
update


#!/bin/bash
echo "DELL Server Tool install for PVE8.x"

while true; do

read -p "Do you want to proceed? (yes/no) " yn

case $yn in 
yes ) 

curl -fsSL https://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/dell-apt-key.gpg
clear

echo "
deb [signed-by=/etc/apt/trusted.gpg.d/dell-apt-key.gpg] http://linux.dell.com/repo/community/openmanage/11000/jammy jammy main
deb [signed-by=/etc/apt/trusted.gpg.d/dell-apt-key.gpg] http://linux.dell.com/repo/community/openmanage/iSM/5100/jammy jammy main
# For Proxmox 7
#deb [signed-by=/etc/apt/trusted.gpg.d/dell-apt-key.gpg] http://linux.dell.com/repo/community/openmanage/10300/focal focal main
# If you want iDRAC Service Module(iSM)
deb [signed-by=/etc/apt/trusted.gpg.d/dell-apt-key.gpg] http://linux.dell.com/repo/community/openmanage/iSM/5100/bullseye bullseye main
deb http://ftp.debian.org/debian bullseye main" > /etc/apt/sources.list.d/linux.dell.com.sources.list
clear

echo "
Package: *
Pin: release n=bullseye
Pin-Priority: -1
" > /etc/apt/preferences.d/bullseye
clear

echo "DELL Server Tools"
apt update
apt install libssl1.1
apt update
apt-get install srvadmin-idracadm8
apt-get install dcism
clear

systemctl enable dcismeng
systemctl start dcismeng

echo "Load DELL System Infos"
racadm getsysinfo
echo "Install finish :)"

break;;

no ) echo exiting...;
exit;;

* ) echo invalid response;;

esac

done


root@t310pve:/opt/scripts# 