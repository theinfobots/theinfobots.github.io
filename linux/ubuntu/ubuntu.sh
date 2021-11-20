#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "[ ? ] You must run this script $0 with sudo."
	exit 1;
fi

if [[ $1 == "--gnome" ]]; then
/usr/bin/clear

	source config.sh

	read -p " Run this on your ubuntu system auto config installer? (Y/n):" Yn

if [[ $Yn =~ ^[Yy] ]]; then

	echo -e "\n\t ${COLOR_LIGHT_RED}Ubuntu installer Running now${RESET_ALL}\n\n"

	sudo dpkg --configure -a && sleep 2

	update-upgrade;
	installPackages;
	config;
	swapp;
	firewall;
	grub;

	echo -e "\n"
	sudo apt-get --fix-broken install | grep 0
	echo -e "\n"

	echo -e "All Done, All Completed system..\n"
	echo -e "[ Tip ] sudo apt install -y libdvd-pkg ttf-mscorefonts-installer && sudo dpkg-reconfigure libdvd-pkg\n"
	echo -e "\t After scriptet are is done reboot / command: sudo reboot\n"

	rm $0
	rm config.sh

elif [[ $Yn =~ ^[Nn] ]]; then
	echo -e "[ - ] OK, Well done. Hi"
	rm $0
	rm config.sh
	exit 1;

else
	echo -e "[ ${COLOR_RED}!${RESET_ALL} ] You must answer Y or N"
	exit 1;
fi
else
	echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] You must try this $0 --install"
	exit 1;
fi
