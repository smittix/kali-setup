#!/bin/bash
clear
#Vars
gitdir=/root/Tools
dir1=/root/Tools/hcxtools
dir2=/root/Tools/hcxdumptool
mkdir -p $gitdir

#Handling
die() { echo "$@" 1>&2; exit 1; }

#Check if root
if [[ `id -u` -ne 0 ]] ; then
  die 'Must be executed as root.'
fi

#text to user
PS3='Please enter your choice: '

#input options
options=("1-Post-Install-Upgrade" "2-Dist-Upgrade" "3-Install-Packages" "4-Install-Git-Repos" "5-Install-Oh-My-ZSH" "6-Install-Vbox-Additions" "7-Install-Wifite-Dependencies" "8-Update-Git-Tools" "9-Exit")

#function to display options nice
function optionsClean() {
	for item in ${options[*]}; do
		printf "   %s\n" $item
	done
}
#Menu Headers
printf "\033[1;41m  Kali Post Install Script - Version 0.1\033[1;m\n\033[1;46m  By James Smith | https://www.stealingthe.network | @iamstx  \033[1;m\n"
printf "\033[1;46m  If you've just installed Kali Version 2, It's recommended to go with Option 1 first.  \033[1;m\n"

#define what to do for each option
select opt in "${options[@]}"
do
	case $opt in
		"1-Post-Install-Upgrade")
		printf "\033[1;41m Starting apt-get update...\x1b[0m\n\n"
		apt-get update
		printf "\033[1;41m Starting apt-get upgrade...\x1b[0m\n\n"
		apt-get upgrade -y
		printf "\033[1;41m Now Cleaning Up...\x1b[0m\n\n"
		apt-get -y autoremove
		apt-get -y autoclean
		updatedb
		printf "\033[1;41m Nice and Clean.\x1b[0m\n\n"
		clear
		printf "\033[1;41m Initialising Metasploit Database..\x1b[0m\n\n"
		msfdb init
                printf "\033[1;41m Enabling postresql for autostart..\x1b[0m\n\n"
		update-rc.d postgresql enable
		optionsClean
		;;
		"2-Dist-Upgrade")
		printf "\033[1;41m Starting apt-get update...\x1b[0m\n\n"
		apt-get update
		printf "\033[1;41m Starting apt-get dist-upgrade...\x1b[0m\n\n"
		apt-get dist-upgrade -y
		printf "\033[1;41m Done!\x1b[0m\n\n"
		optionsClean
		;;
		"3-Install-Packages")
		printf "\033[1;41m Starting apt-get update...\x1b[0m\n\n"
		apt install libreoffice brutespray crackmapexec bloodhound ftp secure-delete flameshot bleachbit veil veil-evasion nfs-common onesixtyone finger rsh-client jxplorer sipcalc nbtscan recordmydesktop eyewitness filezilla tmux zsh testssl.sh freerdp2-x11 remmina neo4j bettercap seclists shellter backdoor-factory responder firmware-mod-kit gobuster
		printf "\033[1;41m Starting apt-get install -y linux-headers-$(uname -r)...\x1b[0m\n\n"
		apt-get install -y linux-headers-$(uname -r)
		printf "\033[1;41m Done!\x1b[0m\n\n"
		optionsClean
		;;
		"4-Install-Git-Repos")
		printf "\033[1;41m Checking for Tools Directory...(Repo's will be cloned to /root/Tools) \x1b[0m\n\n"
		printf "\033[1;41m Cloning Git Repo's...\x1b[0m\n\n"
		cd $gitdir
		git clone https://github.com/0xInfection/TIDoS-Framework
		git clone https://github.com/RhinoSecurityLabs/pacu
		git clone https://github.com/m0rtem/CloudFail
		git clone https://github.com/trustedsec/ridenum
		git clone https://github.com/pentestmonkey/windows-privesc-check
		git clone https://github.com/trustedsec/unicorn
		git clone https://github.com/ICSec/airpwn-ng
		git clone https://github.com/adaptivethreat/Empire
		git clone https://github.com/DanMcInerney/wifijammer
		git clone https://github.com/CoreSecurity/impacket
		git clone https://github.com/leebaird/discover
		git clone https://github.com/scrapy/scrapy
		git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF
		git clone https://github.com/drwetter/testssl.sh/
		git clone https://github.com/BishopFox/spoofcheck
		git clone https://github.com/DanMcInerney/icebreaker
		git clone https://github.com/hak5darren/wp6
		git clone https://github.com/superkojiman/onetwopunch
		git clone https://github.com/nccgroup/chuckle
		git clone https://github.com/m3m1t1m/appalyzer
		git clone https://github.com/adipinto/yet-another-nessus-parser
		git clone https://github.com/thelinuxchoice/blackeye
		git clone https://github.com/securestate/king-phisher
		git clone https://github.com/shenril/Sitadel
		git clone https://github.com/khast3x/h8mail
		git clone https://github.com/aquasecurity/kube-hunter
		git clone https://github.com/BlackArch/wordlistctl
		git clone https://github.com/ThoughtfulDev/EagleEye
		git clone https://github.com/cr4shcod3/pureblood
		git clone https://github.com/vaguileradiaz/tinfoleak
		wget https://sec.stanev.org/download/wlc/wlc_0.2.zip
		printf "\033[1;41m Done!\x1b[0m\n\n"
		optionsClean
		;;
		"5-Install-Oh-My-ZSH")
		printf "\033[1;41m Installing Oh My ZSH!...\x1b[0m\n\n"
		wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -P /tmp
		sed -i 's/RUNZSH=${RUNZSH:-yes}/RUNZSH=${RUNZSH:-no}/g' /tmp/install.sh
		chmod +x /tmp/install.sh
		/bin/bash /tmp/install.sh
		printf "\033[1;41m Done!!...\x1b[0m\n\n"
		printf "\033[1;41m Changing the ZSH theme..\x1b[0m\n\n"
		sed -i 's/robbyrussell/jonathan/g' /root/.zshrc
		printf "\033[1;41m Completed.. you will need to restart your terminal to launch ZSH\x1b[0m\n\n"
		rm /tmp/install.sh
		optionsClean
		;;
		"6-Install-Vbox-Additions")
		printf "\033[1;41m Installing VirtualBOx Guest Additions...\x1b[0m\n\n"
		apt-get update
		apt-get install virtualbox-guest-x11 -y
		printf "\033[1;41m Done! You will need to reboot for the changes to take effect.\x1b[0m\n\n"
		optionsClean
		;;
		"7-Install-Wifite-Dependencies")
		printf "\033[1;41m Checking some packages...\x1b[0m\n\n"
		apt install libcurl4-openssl-dev libssl-dev zlib1g-dev
		printf "\033[1;41m Cloning Wifite Dependencies from GitHub...\x1b[0m\n\n"
		cd $gitdir
		git clone https://github.com/ZerBea/hcxtools
		git clone https://github.com/ZerBea/hcxdumptool
		cd $dir2
		make
		make install
		printf "\033[1;41m hcxdumptool installed!...\x1b[0m\n\n"
		cd $dir1 &&
		make
		make install
		printf "\033[1;41m hcxtools installed!...\x1b[0m\n\n"
		optionsClean
		;;
		"8-Update-Git-Tools")
                printf "\033[1;41m Performing a Git Pull on all Repo's...\x1b[0m\n\n"
		printf "\033[1;41m You may see multiple lines of 'already up to date' this is normal.\x1b[0m\n\n"
                cd $gitdir
                ls | xargs -I{} git -C {} pull
		printf "\033[1;41m All Done...\x1b[0m\n\n"
                optionsClean
		;;
		"9-Exit")
		break
		;;
		*) Invalid option ;;
	esac
done
