#!/bin/bash
#Kali Setup script
#variables
clear
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
HEIGHT=15
WIDTH=90
CHOICE_HEIGHT=4
BACKTITLE="Kali Post Install Script - Version 3.0 - By Osiris - https://stealingthe.network"
TITLE="Make a selection"
MENU="Please Choose one of the following options:"

if [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get install nano;
fi

# Directory Variables
gitdir=/opt/tools
mobiledir=/opt/tools/mobile
clouddir=/opt/tools/cloud
wirelessdir=/opt/tools/wireless
reportingdir=/opt/tools/reporting
wordlistsdir=/opt/tools/wordlists
containersdir=/opt/tools/containers
osintdir=/opt/tools/osint
enumdir=/opt/tools/enumeration
cheatsheetsdir=/opt/tools/cheatsheets
privescdir=/opt/tools/privesc
databasedir=/opt/tools/database
dir1=/opt/tools/wireless/hcxtools
dir2=/opt/tools/wireless/hcxdumptool
mkdir -p $gitdir $clouddir $mobiledir $wirelessdir $reportingdir $wordlistsdir $containersdir $osintdir $enumdir $cheatsheetsdir $privescdir $databasedir

#Handling
die() { echo "$@" 1>&2; exit 1; }

#Check if root
if [[ `id -u` -ne 0 ]] ; then
  die 'Must be executed as root.'
fi


OPTIONS=(1 "Post Install Upgrade - Performs a full update and upgrade and sets up the MSF database"
         2 "Install Favourite Packages - This installs a set of useful software that isn't installed by default"
         3 "Install Extra Tools - Useful tools from github"
         4 "Install Melcara - Installs the Melcara Nessus parser"
         5 "Install Wifite Dependencies"
         6 "Quit")

while [ "$CHOICE -ne 4" ]; do
    CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --nocancel \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

    clear
    case $CHOICE in
        1)  printf "\033[1;41m Starting apt-get update...\x1b[0m\n\n"
            sudo apt -y update
	        printf "\033[1;41m Starting apt-get upgrade...\x1b[0m\n\n"
		    sudo apt -y upgrade
		    printf "\033[1;41m Now Cleaning Up...\x1b[0m\n\n"
		    sudo apt -y autoremove
		    sudo apt -y autoclean
		    updatedb
		    printf "\033[1;41m Nice and Clean.\x1b[0m\n\n"
		    clear
		    printf "\033[1;41m Initialising Metasploit Database..\x1b[0m\n\n"
		    msfdb init
            printf "\033[1;41m Enabling postresql for autostart..\x1b[0m\n\n"
		    update-rc.d postgresql enable
            notify-send "You're fully updated!" --expire-time=10
           ;;
        2)  printf "\033[1;41m Starting apt-get update...\x1b[0m\n\n"
		    sudo apt -y install tor libreoffice brutespray crackmapexec bloodhound ftp secure-delete flameshot bleachbit veil veil-evasion nfs-common onesixtyone finger rsh-client jxplorer sipcalc nbtscan recordmydesktop eyewitness filezilla tmux zsh testssl.sh freerdp2-x11 remmina neo4j bettercap seclists shellter backdoor-factory responder firmware-mod-kit gobuster docker.io
		    printf "\033[1;41m Starting apt-get install -y linux-headers-$(uname -r)...\x1b[0m\n\n"
		    sudo apt -y install -y linux-headers-$(uname -r)
		    printf "\033[1;41m Done!\x1b[0m\n\n"
            notify-send "Software has been installed from the repos!" --expire-time=10
           ;;
        3)  printf "\033[1;41m Checking for Tools Directory...(Repo's will be cloned to /opt/tools) \x1b[0m\n\n"
		    printf "\033[1;41m Cloning Git Repo's...\x1b[0m\n\n"
		    cd $gitdir
		    mkdir -p /opt/tools/cloud/Cloudfail
		    git clone https://github.com/m0rtem/CloudFail $clouddir/Cloudfail
		    mkdir -p $privescdir/windows-privesc-check
		    git clone https://github.com/pentestmonkey/windows-privesc-check $privescdir/windows-privesc-check
		    mkdir -p $wirelessdir/airpwn-ng
		    git clone https://github.com/ICSec/airpwn-ng $wirelessdir/airpwn-ng
		    mkdir -p $wirelessdir/wifijammer
		    git clone https://github.com/DanMcInerney/wifijammer $wirelessdir/wifijammer
		    mkdir -p $osintdir/discover
		    git clone https://github.com/leebaird/discover $osintdir/discover
		    mkdir -p $mobiledir/MobSF
		    git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF $mobiledir/MobSF
		    mkdir -p $enumdir/spoofcheck
		    git clone https://github.com/BishopFox/spoofcheck $enumdir/spoofcheck
		    mkdir -p $wirelessdir/wp6
		    git clone https://github.com/hak5darren/wp6 $wirelessdir/wp6
		    mkdir -p $containersdir/kube-hunter
		    git clone https://github.com/aquasecurity/kube-hunter $containersdir/kube-hunter
		    mkdir -p $osintdir/pwndb
		    git clone https://github.com/davidtavarez/pwndb $osintdir/pwndb
		    mkdir -p $mobiledir/pyusbmux
		    git clone  https://github.com/phx/pyusbmux.git $mobiledir/pyusbmux
		    wget https://github.com/OWASP/wstg/blob/master/checklist/WSTG-Checklist_v4.2.xlsx -P /opt/tools/cheatsheets
		    cpan install Encoding::BER
		    mkdir -p $enumdir/rdp-sec-check
		    git clone https://github.com/CiscoCXSecurity/rdp-sec-check $enumdir/rdp-sec-check
		    printf "\033[1;41m Installing Objection and Frida via Pip!\x1b[0m\n\n"
		    apt install -y python3-pip
		    pip3 install objection
		    pip3 install frida
		    printf "\033[1;41m Pulling MobSF Docker Image!\x1b[0m\n\n"
		    apt install -y docker.io
		    docker pull opensecurity/mobile-security-framework-mobsf
		    printf "\033[1;41m MobSF Docker Image was installed - run it using: docker run -it --rm -p 8000:8000 opensecurity/mobile-security-framework-mobsf:latest\x1b[0m\n\n"
		    printf "\033[1;41m Done!\x1b[0m\n\n"
            notify-send "Extra Tools Installed" --expire-time=10
           ;;
        4)  printf "\033[1;41m Installing Melcara Nessus Parser...\x1b[0m\n\n"
		    export PERL_MM_USE_DEFAULT=1
		    mkdir -p /opt/tools/reporting/melcara && cd /opt/tools/reporting/melcara
		    wget http://www.melcara.com/wp-content/uploads/2017/09/parse_nessus_xml.v24.pl_.zip
		    unzip parse_nessus_xml.v24.pl_.zip
		    chmod +x parse_nessus_xml.v24.pl
		    cpan install Excel::Writer::XLSX XML::Simple XML::TreePP Math::Round Excel::Writer Data::Table
		    rm parse_nessus_xml.v24.pl_.zip
		    printf "\033[1;41m Done! .\x1b[0m\n\n"
            notify-send "Melcara has been installed" --expire-time=10
           ;;
        5)  printf "\033[1;41m Checking some packages...\x1b[0m\n\n"
		    apt install -y libcurl4-openssl-dev libssl-dev zlib1g-dev
		    printf "\033[1;41m Cloning Wifite Dependencies from GitHub...\x1b[0m\n\n"
		    cd $gitdir
		    git clone https://github.com/ZerBea/hcxtools $wirelessdir/hcxtools
		    git clone https://github.com/ZerBea/hcxdumptool $wirelessdir/hcxdumptool
		    cd $dir2
		    make
		    make install
		    printf "\033[1;41m hcxdumptool installed!...\x1b[0m\n\n"
		    cd $dir1 &&
		    make
		    make install
		    printf "\033[1;41m hcxtools installed!...\x1b[0m\n\n"
            notify-send "Software has been installed" --expire-time=10
           ;;
        6)
          exit 0
          ;;
    esac
done
