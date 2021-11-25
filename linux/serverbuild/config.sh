#!/bin/bash

# Add colors options & font text options
export ITALIC='\e[3m'
export BOLD='\e[1m'
export DIM='\e[2m'
export UNDERLINE='\e[4m'
export BLINK='\e[5m'
export RESET_ALL='\e[0m' # No Color
export REVERSE='\e[7m' #(invert the foreground and background colors)
export HIDDEN='\e[7m' #(useful for passwords)

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

export V='2.3.1'

user_log=$(logname)

echo -e ${COLOR_BLUE}
curl https://theinfobots.com/linux/serverbuild/ourserverlab.txt
echo -e ${RESET_ALL}

install_server(){

	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing Apache HTTP Server."
	sudo apt-get install -y apache2 >/dev/null 2>&1 && sleep 2 && echo -e "[ ${COLOR_GREEN}Installed${RESET_ALL} ]"
	sleep 3
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Installing PHP For Server."
	sudo apt-get install -y php php-mysql libapache2-mod-php >/dev/null 2>&1 && sleep 2 && echo -e  "[ ${COLOR_GREEN}Installed${RESET_ALL} ]"

	echo -e "[ ${COLOR_RED}!${RESET_ALL} ] Disable 000-Default.conf now"
	sudo a2dissite /etc/apache2/sites-available/000-default.conf >/dev/null 2>&1 && echo -n "[ ${COLOR_RED}OK${RESET_ALL} ]"
	sleep 2
	echo -e "[ ${COLOR_GREEN}Reload Apache Now${RESET_ALL} ]"
	sudo systemctl reload apache2 >/dev/null 2>&1 && echo -e "[ ${COLOR_GREEN}Reloaded${RESET_ALL} ]"
	sleep 2
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Setting up apache configurations server file now."
	sleep 1

	sudo echo -e '

	<VirtualHost *:80>
        # The ServerName directive sets the request scheme, hostname and port that
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the requests Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin admin@webmaster.com
        DocumentRoot /var/www/html
	#ServerName
	#ServerAlias

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with a2disconf.
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet

' >> /etc/apache2/sites-available/000-default.conf && echo -ne "Default server configuration has changed. \n";
sleep 2

sudo a2ensite /etc/apache2/sites-available/000-default.conf >/dev/null 2>&1 && echo -e "Server configuration is enabled.";
sleep 2

echo -e "Reloading service apache http server. \n"
sudo systemctl reload apache2 >/dev/null 2>&1 && echo -e " [ ${COLOR_GREEN}OK${RESET_ALL} ]"
sleep 2

echo -e "\n Removing default apache page file."
sudo rm /var/www/html/index.html >/dev/null 2>&1 && echo -e "[ ${COLOR_GREEN}OK${RESET_ALL} ]"
sleep 2

echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Downloading default server page file."
wget https://theinfobots.com/server/default/defaultserver >/dev/null 2>&1 && echo -e "[ ${COLOR_GREEN}Downloaded${RESET_ALL} ]"
sleep 2

echo -e "Renamed defaultserver file and moved, in -> /var/www/html";
sudo mv defaultserver /var/www/html/index.php >/dev/null 2>&1 && echo -e "[ ${COLOR_GREEN}DONE${RESET_ALL} ]"
sleep 2

echo -e "Create /var/www/html in your home dir ~/html";
sudo chown ${user_log} /var/www/html >/dev/null 2>&1 && echo -e "Step 1 of 3 completed";
sleep 2
sudo chgrp ${user_log} /var/www/html >/dev/null 2>&1 && echo -e "Step 2 of 3 completed";
sleep 2
ln -s /var/www/html /home/${user_log}/html >/dev/null 2>&1 && echo -e "Step 3 of 3 completed";

echo -e "[ DONE ] We coming restarting apache service...";
sudo systemctl restart apache2 >/dev/null 2>&1 && echo -e "[ OK ]";

}
