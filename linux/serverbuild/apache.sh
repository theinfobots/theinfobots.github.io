#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "[ ! ] You must run with sudo."
	exit 1;
fi

yourip(){

	read -p "[ ! ] Enter your localhost static ip addr (eg. eth0:wlan0:inet:000.000.00.00 ):" ip

	echo -e "\n Is set [ ${COLOR_GREEN}${ip}${RESET_ALL} ] \n"

}

if [[ $1 == "--server" ]]; then

	/usr/bin/clear

	source config.sh

	echo -e "Version: ${COLOR_LIGHT_GREEN}${V}${RESET_ALL}"
	echo -e "Welcome to this Server Building.\n"
	echo -e "Server Builder does this:\n"

	echo -e "Installing server tools."
	echo -e "Fixing better server."
	echo -e "Setting up one server."
	echo -e "Install server and fixing configurations files...\n"

	read -p "Run this auto config server? (Y/n):" Yn

if [[ $Yn =~ ^[Yy]$ ]]; then

	echo -e "\n [ ${COLOR_RED}!${RESET_ALL} ] Running \n"
	yourip;
	install_server;

	echo -e "\n All is done and Compeleted Server..."
	echo -e "We will modify the script server on the way, develop it even more... \n"

        PHP_VERSION=$(php -v | grep ^PHP | cut -d' ' -f2)
	sleep 1
	echo -e "\n  PHP ${PHP_VERSION} installed.";

	echo -e "\n Test this out - http://${ip} \n";
	
	rm $0
	rm config.sh 

elif [[ $Yn =~ ^[Nn]$ ]]; then

	echo -e "[ ${COLOR_GREEN}OK${RESET_ALL} ] Well done, Hi."
	rm $0
	rm config.sh
	exit 1;

else

	echo -e "[ ! ] You must answer y or n."
	exit 1;

fi
else

	echo -e "[ ? ] Tests this $0 --server"
	exit 1;

fi
