#!/bin/bash

##  Must be run with sudo.
if [[ $EUID -ne 0 ]]; then
    echo "[ ? ] Run this $0 with sudo.";
    exit 1;
fi

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

export V="1.2.5"

user=$(logname)

fixlist(){

echo -e "[ ${COLOR_PURPLE}!${RESET_ALL} ] Installing debian systems correctly."
sleep 5

echo -e "Searching after files";
sleep 3

echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Target file -> sources.list"
sleep 4 && echo -e "[ ${COLOR_RED}!${RESET_ALL} ] Remove sources.list file now..."

sudo rm /etc/apt/sources.list >/dev/null 2>&1 && echo -e "${COLOR_RED}[ - ] Sources file is deleted.${RESET_ALL}";
sleep 3

sudo touch /etc/apt/sources.list >/dev/null 2>&1 && echo -e "${COLOR_GREEN}[ + ] Create new sources.list in /etc/apt/.. ${RESET_ALL}";
sleep 3

sudo echo -ne '

# deb cdrom:[Debian GNU/Linux 10.3.0 _Buster_ - Official amd64 NETINST 20200208-12:07]/ buster main

# deb cdrom:[Debian GNU/Linux 10.3.0 _Buster_ - Official amd64 NETINST 20200208-12:07]/ buster main

deb http://deb.debian.org/debian/ buster main contrib non-free
deb-src http://deb.debian.org/debian/ buster main contrib non-free

deb http://security.debian.org/debian-security buster/updates main contrib non-free
deb-src http://security.debian.org/debian-security buster/updates main contrib non-free

# buster-updates, previously known as volatile
deb http://deb.debian.org/debian/ buster-updates main contrib non-free
deb-src http://deb.debian.org/debian/ buster-updates main contrib non-free

#Latest security updates
deb http://security.debian.org/ buster/updates main contrib non-free

#propsed addititons
deb http://deb.debian.org/debian buster-proposed-updates main contrib non-free

#backports
deb http://deb.debian.org/debian buster-backports main contrib non-free
deb-src http://deb.debian.org/debian buster-backports main contrib non-free

# This system was installed using small removable media
# (e.g. netinst, live or single CD). The matching deb cdrom
# entries were disabled at the end of the installation process.
# For information about how to configure apt package sources,
# see the sources.list(5) manual.

' >> /etc/apt/sources.list && sleep 3 && echo -ne "Sources.list Configuration has changed, in /etc/apt/..";

sleep 5 && sudo apt update >/dev/null 2>&1 && echo -e "[ ${COLOR_GREEN}OK${RESET_ALL} ] Update and New sources.list completed"

echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] Checking for packages!"

}

deb_packages() {

    echo -e "\n  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing synaptic.";
    sudo apt install -y synaptic >/dev/null 2>&1 && echo -e "  [ ${COLOR_LIGHT_GREEN}step 1 of 4 completed.${RESET_ALL} ]";
    sleep 3

    echo -ne "  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing apt-xapian-index to synaptic.";
    sudo apt install -y apt-xapian-index >/dev/null 2>&1 && echo -e "[ ${COLOR_LIGHT_GREEN}step 2 of 4 completed.${RESET_ALL} ]\n";
    sleep 3

    echo -ne "  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing policykit-1-gnome.";
    sudo apt install -y policykit-1-gnome >/dev/null 2>&1 && echo -e "[ ${COLOR_LIGHT_GREEN}step 3 of 4 completed.${RESET_ALL} ]\n";
    sleep 3

    echo -ne "  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing net-tools.";
    sudo apt install -y net-tools >/dev/null 2>&1 && echo -e "[ ${COLOR_LIGHT_GREEN}step 4 of 4 completed.${RESET_ALL} ]\n";
    sleep 3


    echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing more packages"
    sleep 3

    echo -ne "  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing 5 packages to debian xfce..";
    sudo apt install -y xfce4-taskmanager rsync xfce4-power-manager xfce4-terminal fonts-noto-mono >/dev/null 2>&1 && echo -e "[ ${COLOR_LIGHT_GREEN}step 1 of 9 completed.${RESET_ALL} ]\n";

    echo -ne "  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing 5 packages to debian xfce.";
    sudo apt install -y thunar-archive-plugin libreoffice-impress mousepad ristretto xserver-xorg-input-synaptics >/dev/null 2>&1 && echo -e "[ ${COLOR_LIGHT_GREEN}step 2 of 9 completed.${RESET_ALL} ]\n";

    echo -ne "  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing 5 packages to debian xfce.";
    sudo apt install -y fonts-dejavu-extra network-manager-gnome mythes-en-us hunspell ttf-dejavu >/dev/null 2>&1 && echo -e "[ ${COLOR_LIGHT_GREEN}step 3 of 9 completed.${RESET_ALL} ]\n";

    echo -ne "  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing 5 packages to debian xfce.";
    sudo apt install -y  fonts-liberation hunspell-en-us aspell network-manager ttf-bitstream-vera >/dev/null 2>&1 && echo -e "[ ${COLOR_LIGHT_GREEN}step 4 of 9 completed.${RESET_ALL} ]\n";

    echo -ne "  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing 5 packages to debian xfce.";
    sudo apt install -y fonts-dejavu p7zip-full libreoffice-writer xfce4-xkb-plugin xfce4-screenshooter >/dev/null 2>&1 && echo -e "[ ${COLOR_LIGHT_GREEN}step 5 of 9 completed.${RESET_ALL} ]\n";

    echo -ne "  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing 5 packages to debian xfce.";
    sudo apt install -y xfce4-clipman fonts-droid-fallback xfce4-panel-dev debian-keyring ttf-liberation >/dev/null 2>&1 && echo -e "[ ${COLOR_LIGHT_GREEN}step 6 of 9 completed.${RESET_ALL} ]\n";

    echo -ne "  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing packages to debian xfce.";
    sudo apt install -y ttf-dejavu-extra libreoffice-calc aspell-en p7zip unzip xarchiver ttf-freefont >/dev/null 2>&1 && echo -e "[ ${COLOR_LIGHT_GREEN}step 7 of 9 completed.${RESET_ALL} ]\n";

    echo -ne "  [ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing packages to debian xfce.";
    sudo apt install -y fonts-freefont-ttf ttf-mscorefonts-installer ttf-dejavu-core fonts-opensymbol ufw build-essential vlc >/dev/null 2>&1 && echo -e "[ ${COLOR_LIGHT_GREEN}step 8 of 9 completed.${RESET_ALL} ]\n";
    sleep 3
    echo -ne "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing packages to debian xfce."
    sudo apt install -y rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi >/dev/null 2>&1 && echo "[ step 9 of 9 completed. ]"

}

firewall(){

    echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Enabled firewall now on your linux computer";
    sleep 5

    sudo ufw enable && echo -e "[ ${COLOR_RED}!${RESET_ALL} ] Firewall is on";
    sleep 4

    echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Adding ports to firewall...";
    sleep 4

    sudo ufw allow 80 >/dev/null 2>&1 && echo -ne "Adding port 80";
    sleep 4
    sudo ufw allow 443 >/dev/null 2>&1 && echo -ne "Adding port 443";
    sleep 4
    sudo ufw allow 22 >/dev/null 2>&1 && echo -ne "Adding port 22";
    sleep 4
    sudo ufw allow 21 >/dev/null 2>&1 && echo -ne "Adding port 21";
    sleep 4
    sudo ufw allow 20 >/dev/null 2>&1 && echo -ne "Adding port 20";
    sleep 4
    sudo ufw allow 23 >/dev/null 2>&1 && echo -ne "Adding port 23";
    sleep 4

    echo -ne "Addings of ports is done...";

}

grub(){

    echo "Adding new grub file";
    sleep 5

    sudo rm /etc/default/grub >/dev/null 2>&1 && echo "Deleted default grub.";
    sleep 4

    sudo touch /etc/default/grub >/dev/null 2>&1 && echo "Created new default grub now.";
    sleep 4

    sudo echo '
# If you change this file, run update-grub afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n Simple configuration

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=lsb_release -i -s 2> /dev/null || echo Debian
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX=""

# Uncomment to enable BadRAM filtering, modify to suit your needs
# This works with Linux (no patch required) and with any kernel that obtains
# the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
#GRUB_BADRAM="0x01234567,0xfefefefe,0x89abcdef,0xefefefef"

# Uncomment to disable graphical terminal (grub-pc only)
#GRUB_TERMINAL=console

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command vbeinfo
#GRUB_GFXMODE=640x480

# Uncomment if you dont want GRUB to pass "root=UUID=xxx" parameter to Linux
#GRUB_DISABLE_LINUX_UUID=true

# Uncomment to disable generation of recovery mode menu entries
#GRUB_DISABLE_RECOVERY="true"

# Uncomment to get a beep at grub start
#GRUB_INIT_TUNE="480 440 1"
' >> /etc/default/grub && sleep 3 && echo -ne "Write and changed the file grub";
sleep 3
echo "Update default grub now";
sleep 2
sudo update-grub >/dev/null 2>&1 && echo -e "[ ${COLOR_GREEN}OK${RESET_ALL} ]";
sleep 3
echo -ne "Reboot soon after scriptet are done...";

}

deb_user(){

    echo -ne "Adding username to your inlogging";

    sudo touch /usr/share/lightdm/lightdm.conf.d/01_my.conf >/dev/null 2>&1 && echo -ne "Create file to login screen..";
    sleep 3
    echo -ne "Write to login screen";
    sleep 3

    sudo echo "

    [SeatDefaults]
    greeter-hide-users=false

    " >> /usr/share/lightdm/lightdm.conf.d/01_my.conf && sleep 2 && echo "Write and set username to your login screen";

    sleep 3
    echo -ne "Login screen is done";

}

amd(){

	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing firmware realtek"
	sudo apt-get install -y firmware_realtek >/dev/null 2>&1 && echo -e "[ Step 1 of 2 completed. ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing firmware graphics"
	sudo apt-get install -y firmware-amd-graphics >/dev/null 2>&1 && echo -e "[ Step 2 of 2 completed. ]"

}



if [[ $1 == "--xfce" ]]; then

/usr/bin/clear

echo  -e ${COLOR_LIGHT_RED}
  curl https://theinfobots.com/linux/sys/debian-builder.txt
echo -e ${RESET_ALL}

  echo -e "\n${DIM}—————————————————————————————————————————————————————————————————————————————${RESET_ALL}";
  echo -e "Version:${COLOR_LIGHT_GREEN}${V}${RESET_ALL} / Welcome this is a helping you for correctly installed after you installed debian."
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] synaptic - apt-xapian-index - policykit-1-gnome - net-tools";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] xfce4-taskmanager rsync xfce4-power-manager xfce4-terminal fonts-noto-mono";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] thunar-archive-plugin libreoffice-impress mousepad ristretto xserver-xorg-input-synaptics";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] fonts-dejavu-extra network-manager-gnome mythes-en-us hunspell ttf-dejavu";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] fonts-liberation hunspell-en-us aspell network-manager ttf-bitstream-vera";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] fonts-dejavu p7zip-full libreoffice-writer xfce4-xkb-plugin xfce4-screenshooter";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] xfce4-clipman fonts-droid-fallback xfce4-panel-dev debian-keyring ttf-liberation";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] ttf-dejavu-extra libreoffice-calc aspell-en p7zip unzip xarchiver ttf-freefont";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] fonts-freefont-ttf ttf-mscorefonts-installer ttf-dejavu-core fonts-opensymbol ufw build-essential vlc";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] Firewall adding port on your computer 80, 443, 22, 21, 20, 23";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] Create new grub file for fast reboot";
  echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] Fixing to the login screen\n";

  read -p "Install full debian GNU/LINUX systems? (y/n):" Yn

  if [[ $Yn =~ ^[Yy]$ ]]; then

	fixlist;
        deb_packages;
	amd;
        firewall;
        grub;
	rm $0
        echo -e "Congratulations! Now your debian system is correctly installed."
        echo -e "\n  All done, Thanks for using this $0 script!"

elif [[ $Yn =~ ^[Nn]$ ]]; then

        echo -e "[ ${COLOR_RED}*__*${RESET_ALL} ] OK, Have nice day."
        exit 1;

  else
        echo -e "[ ${COLOR_RED}!${RESET_ALL} ] You must answer Y or n.";
        exit 1;
  fi
else
    echo -e "[ ${COLOR_GREEN}?${RESET_ALL} ] Test this $0 --xfce";
    exit 1;
fi
