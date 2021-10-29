# kali-setup

Just a simple script to make new Kali v2 builds usable quickly. I really made this for myself but if others find it useful then that's awesome.

This script has a number of options -

[1] Post Install Upgrade

* Updates the system via an apt update/upgrade
* Cleans the system via an apt autoremove/autoclean
* Initializes the Metasploit Framework database
* Configures the autostart of the postgresql database on boot

[2] Install Packages

Installs the following packages from Kalis repos which are not included by default. Some small utils are also installed due to requiremnets of certain exams.

* tor
* libreoffice
* brutespray
* crackmapexec
* bloodhound
* ftp 
* secure-delete 
* flameshot 
* bleachbit 
* veil 
* veil-evasion 
* nfs-common 
* onesixtyone 
* finger 
* rsh-client 
* jxplorer 
* sipcalc 
* nbtscan 
* recordmydesktop 
* eyewitness 
* filezilla 
* tmux 
* zsh 
* testssl.sh 
* freerdp2-x11 
* remmina 
* neo4j 
* bettercap 
* seclists 
* shellter 
* backdoor-factory 
* responder 
* firmware-mod-kit 
* gobuster 
* docker.io


[3] Install Extra Tools

This option clones various useful git repositories such as -

* https://github.com/m0rtem/CloudFail
* https://github.com/pentestmonkey/windows-privesc-check
* https://github.com/ICSec/airpwn-ng
* https://github.com/DanMcInerney/wifijammer
* https://github.com/leebaird/discover
* https://github.com/BishopFox/spoofcheck
* https://github.com/aquasecurity/kube-hunter
* https://github.com/davidtavarez/pwndb
* https://github.com/phx/pyusbmux.git
* https://github.com/OWASP/wstg/blob/master/checklist/WSTG-Checklist_v4.2.xlsx
* https://github.com/CiscoCXSecurity/rdp-sec-check
* Frida via pip
* Objection via pip
* MobSF Docker Image
	

[4] Install Melcara

* Installs the Melcara Nessus parser from - http://www.melcara.com/archives/253

[5] Install Wifite Dependencies

* This option installs libcurl4-openssl-dev, libssl-dev, zlib1g-dev, hcxtols and hcxdumptools. All to ensure Wifite operates properly.

[6] Exit

* Does this really need explaining :)

