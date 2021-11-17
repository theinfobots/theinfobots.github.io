#!/bin/bash

# Add colors options & font text options
export ITALIC='\e[3m'
export B='\e[1m'
export DIM='\e[2m'
export UNDERLINE='\e[4m'
export BLINK='\e[5m'
export RESET_ALL='\e[0m'
export REVERSE='\e[7m' #(invert the foreground and background colors)
export HIDDEN='\e[7m' #(useful for passwords)

export COLOR_NC='\e[0m' # No Color
export COLOR_BLACK='\e[0;30m'
export COLOR_GRAY='\e[1;30m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export COLOR_WHITE='\e[1;37m'

export V='1.5.2'

user_log=$(logname)

update-upgrade(){

	echo -e "[ ${COLOR_LIGHT_RED}Running now${RESET_ALL} ] Update & Upgrade running now.\n";
	sleep 4
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Update system now"
	sudo apt-get update >/dev/null 2>&1 && echo -e "[ Step 1 of 2 completed ]";
	sleep 4
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Upgrade system now"
	sudo apt-get upgrade -y >/dev/null 2>&1 && echo -e "[ Step 2 of 2 completed ]"
	sleep 4
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Update system now";
	sudo apt update -y >/dev/null 2>&1 && echo -e "[ Step 1 of 2 completed ]";
	sleep 4
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Upgrade system now";
	sudo apt upgrade -y >/dev/null 2>&1 && echo -e "[ Step 2 of 2 completed ]";
	sleep 4
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Dist-Upgrade system";
	sudo apt-get dist-upgrade -y >/dev/null 2>&1 && echo -e "[ Step 1 of 2 completed ]";
	sleep 4
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Full-upgrade system";
	sudo apt full-upgrade -y >/dev/null 2>&1 && echo -e "[ Step 2 of 2 completed ]";
	sleep 4
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Autoremove clearing dependencies that are no longer required in linux system.";
	sudo apt autoremove -y >/dev/null 2>&1 && echo -e "[ Step 1 of 1 completed ]";
	sleep 4
	echo -e "\n All is done updated and upgraded.\n";
	sleep 2
	sudo apt-get --fix-broken install | grep 0
	echo -e "_________________________________________________________________________\n"

}

echo -e ${COLOR_LIGHT_PURPLE}
curl https://theinfobots.com/linux/sys/ubuntu-builder.txt
echo -e ${RESET_ALL}

echo -e "[ ${COLOR_GREEN}21.04${RESET_ALL} ] Ubuntulab Building Systems / Version: ${COLOR_LIGHT_GREEN}${V}${RESET_ALL}\n";
echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] What is ubuntu installer? Helping you for better system and fixing your systems for what you need."
echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] Here you can see a list of what the script will do on your ubuntu system.\n"
echo -e "[ ${COLOR_RED}!${RESET_ALL} ] This can may take some time..."

echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] Update & upgrade system";
echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] Install Codecs & Microsoft Fonts";
echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] Enable Minimize for better window";
echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] Installing Gnome Tweaks and other tools";
echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] Enable Gnome Extensions and installings more tools";
echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] adding and fixing tools\n";

installPackages(){

	echo -e "[ ${COLOR_GREEN}OK${RESET_ALL} ] Installing packages at ubuntu."
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing Gnome tweaks now"
	sudo apt install -y gnome-tweaks >/dev/null 2>&1 && echo -e "[ Step 1 of 10 completed ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing Codecs & Microsoft Fonts"
	sudo apt install -y ubuntu-restricted-extras ubuntu-restricted-addons >/dev/null 2>&1 && echo -e "[ Step 2 of 10 completed ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing enable gnome extensions"
	sudo apt install -y chrome-gnome-shell gnome-shell-extensions >/dev/null 2>&1 && echo -e "[ Step 3 of 10 completed ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Adding repository for ubuntu-cleaner"
	sudo add-apt-repository -y ppa:gerardpuig/ppa >/dev/null 2>&1 && echo -e "[ Added for ppa repo completed ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] System update"
	sudo apt-get update >/dev/null 2>&1 && echo -e "[ ${COLOR_GREEN}OK${RESET_ALL} ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing ubuntu-cleaner now"
	sudo apt-get install -y ubuntu-cleaner >/dev/null 2>&1 && echo -e "[ Step 4 of 10 compeleted ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing JAVA"
	sudo apt install -y openjdk-14-jre >/dev/null 2>&1 && echo -e "[ Step 5 of 10 compeleted ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Adding repository for celluloid"
	sudo add-apt-repository -y ppa:xuzhen666/gnome-mpv >/dev/null 2>&1 && echo -e "[ Added for gnome-mpv repo ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] System update"
	sudo apt-get update >/dev/null 2>&1 && echo -e "[ ${COLOR_GREEN}OK${RESET_ALL} ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing celluloid"
	sudo apt install -y celluloid >/dev/null 2>&1 && echo -e  "[ Step 6 of 10 completed ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing tlp, tp-smapi-dkms, acpi-call-dkms"
	sudo apt install -y tlp tp-smapi-dkms acpi-call-dkms >/dev/null 2>&1 && echo -e "[ Step 7 of 10  completed ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing firewall, synaptic, dconf, ttf-mscorefonts-installer, xserver-xorg-input-synaptics & more tools"
	sudo apt-get install -y ufw synaptic dconf ttf-mscorefonts-installer xserver-xorg-input-synaptics apt-xapian-index policykit-1-gnome net-tools >/dev/null 2>&1 && echo -e "[ Step 8 of 10 completed ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing build-essential, vlc & more tools"
	sudo apt-get install -y build-essential vlc ttf-dejavu-extra libreoffice-calc p7zip unzip xarchiver ttf-freefon ttf-liberation  fonts-noto-mono ttf-dejavu network-manager rar unrar >/dev/null 2>&1 && echo -e "[ Step 9 of 10  completed ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing fonts and more tools"
	sudo apt-get install -y ttf-bitstream-vera fonts-freefont-ttf ttf-dejavu-core fonts-opensymbol libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi >/dev/null 2>&1 && echo -e "[ Step 10 of 10 completed ]"
	sleep 2

}


config(){

	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Enable minimize in system" && sleep 3 &&
	gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize' >/dev/null 2>&1 && sleep 3 && echo -e "[ ${COLOR_GREEN}Enabled Minimize${RESET_ALL} ]"

}

swapp(){

	echo "Fixing swapp file."

	sudo rm /etc/sysctl.conf >/dev/null 2>&1 && sleep 3 && echo -e "Removing configuration ${COLOR_RED}sysctl.conf${RESET_ALL} IN /etc/sysctl.conf" && sleep 3

	sudo touch /etc/sysctl.conf >/dev/null 2>&1 && sleep 3 && echo -e "Added and create new configuration [ ${COLOR_GREEN}sysctl.conf${RESET_ALL} ]"  && sleep 3

	sudo echo -ne '

# /etc/sysctl.conf - Configuration file for setting system variables See /etc/sysctl.d/ for additional system variables.} See sysctl.conf (5) for information.
#
#kernel.domainname = example.com Uncomment the following to stop low-level messages on console kernel.printk = 3 4 1 3
##############################################################3
# Functions previously found in netbase
#
# Uncomment the next two lines to enable Spoof protection (reverse-path filter) Turn on Source Address Verification in all interfaces to prevent some spoofing attacks net.ipv4.conf.default.rp_filter=1 net.ipv4.conf.all.rp_filter=1 Uncomment the next line to 
# enable TCP/IP SYN cookies See http://lwn.net/Articles/277146/ Note: This may impact IPv6 TCP sessions too
#net.ipv4.tcp_syncookies=1 Uncomment the next line to enable packet forwarding for IPv4 net.ipv4.ip_forward=1 Uncomment the next line to enable packet forwarding for IPv6 Enabling this option disables Stateless Address Autoconfiguration based on Router 
#  Advertisements for this host
#net.ipv6.conf.all.forwarding=1
###################################################################
# Additional settings - these settings can improve the network security of the host and prevent against some network attacks including spoofing attacks and man in the middle attacks through redirection. Some network environments, however, require that these 
# settings are disabled so review and enable them as needed.
#
# Do not accept ICMP redirects (prevent MITM attacks) net.ipv4.conf.all.accept_redirects = 0 net.ipv6.conf.all.accept_redirects = 0 _or_ Accept ICMP redirects only for gateways listed in our default gateway list (enabled by default) 
# net.ipv4.conf.all.secure_redirects = 1
#
# Do not send ICMP redirects (we are not a router) net.ipv4.conf.all.send_redirects = 0
#
# Do not accept IP source route packets (we are not a router) net.ipv4.conf.all.accept_source_route = 0 net.ipv6.conf.all.accept_source_route = 0
#
# Log Martian Packets net.ipv4.conf.all.log_martians = 1
#
###################################################################
# Magic system request Key 0=disable, 1=enable all Debian kernels have this set to 0 (disable the key) See https://www.kernel.org/doc/Documentation/sysrq.txt for what other values do kernel.sysrq=1
###################################################################
# Protected links
#
# Protects against creating or following links under certain conditions Debian kernels have both set to 1 (restricted) See https://www.kernel.org/doc/Documentation/sysctl/fs.txt fs.protected_hardlinks=0 fs.protected_symlinks=0

vm.swappiness=10

' >> /etc/sysctl.conf && sleep 3 && echo -e "[ sysctl.conf Configuration has changed. ] \n"

cat /proc/sys/vm/swappiness && echo -e "\n [ ${COLOR_GREEN}DONE${RESET_ALL} ]"

}

firewall(){

	echo -e "\n [ ${COLOR_RED}!${RESET_ALL} ] Firewall fixing.."
	sleep 2
	sudo ufw enable >/dev/null 2>&1 && sleep 2 && echo -ne "\n [ ${COLOR_GREEN}OK${RESET_ALL} ] Firewall is active when reboot startup.."
	sleep 2
	echo -e "\n [ ${COLOR_RED}!${RESET_ALL} ] Adding ports to firewall"
	sleep 2
	sudo ufw allow 80 >/dev/null 2>&1 && sleep 2 && echo -ne "\n [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Adding port 80"
	sleep 2
	sudo ufw allow 443 >/dev/null 2>&1 && sleep 2 && echo -ne "\n [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Adding port 443"
	sleep 2
	sudo ufw allow 22 >/dev/null 2>&1 && sleep 2 && echo -ne "\n [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Adding port 22"
	sleep 2
	sudo ufw allow 21 >/dev/null 2>&1 && sleep 2 && echo -ne "\n [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Adding port 21"
	sleep 2
	sudo ufw allow 20 >/dev/null 2>&1 && sleep 2 && echo -ne "\n [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Adding port 20"
	sleep 2
	sudo ufw allow 23 >/dev/null 2>&1 && sleep 2 && echo -ne "\n [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Adding port 23"
	sleep 2

	echo -ne "\n [ ${COLOR_GREEN}DONE${RESET_ALL} ] Addings of ports is done."


}


grub(){

    echo -e "\n Adding new grub file"
    sleep 5

    sudo rm /etc/default/grub >/dev/null 2>&1 && echo -e "\n Deleted default grub."
    sleep 4

    sudo touch /etc/default/grub >/dev/null 2>&1 && echo -e "\n Created new default grub now."
    sleep 4

    sudo echo '

# If you change this file, run update-grub afterwards to update /boot/grub/grub.cfg. For full documentation of the options in this file, see: info -f grub -n Simple configuration
GRUB_DEFAULT=0
GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=lsb_release -i -s 2> /dev/null || echo Debian
GRUB_CMDLINE_LINUX_DEFAULT="maybe-ubiquity"
GRUB_CMDLINE_LINUX=""
# Uncomment to enable BadRAM filtering, modify to suit your needs This works with Linux (no patch required) and with any kernel that obtains the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
#GRUB_BADRAM="0x01234567,0xfefefefe,0x89abcdef,0xefefefef"
# Uncomment to disable graphical terminal (grub-pc only) GRUB_TERMINAL=console The resolution used on graphical terminal note that you can use only modes which your graphic card supports via VBE you can see them in real GRUB with the command vbeinfo
#GRUB_GFXMODE=640x480
# Uncomment if you dont want GRUB to pass root=UUID=xxx parameter to Linux GRUB_DISABLE_LINUX_UUID=true Uncomment to disable generation of recovery mode menu entries GRUB_DISABLE_RECOVERY='true' Uncomment to get a beep at grub start GRUB_INIT_TUNE=480 440
#1

' >> /etc/default/grub && sleep 3 && echo -ne "\n Write and changed the file grub"

echo -e "\n Update default grub now"
sleep 2
sudo update-grub >/dev/null 2>&1 && echo -e "[ ${COLOR_GREEN}OK${RESET_ALL} ]"
sleep 3
echo -ne "Grub conf file is done..."

}
