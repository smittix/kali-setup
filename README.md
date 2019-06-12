# kali-setup

Just a simple script to make new Kali v2 builds usable quickly. I really made this for myself but if others find it useful then that's awesome.

This script has a number of options -

[1] Post Install Upgrade

* Updates the system via an apt update/upgrade
* Cleans the system via an apt autoremove/autoclean
* Initializes the Metasploit Framework database
* Configures the autostart of the postgresql database on boot

[2] Dist Upgrade

* Performs a distribution upgrade via apt dist-upgrade

[3] Install Packages

* Installs packages from the kali repo's including the following

	* Libre Office
	* crackmapexec
	* brutespray
	* bloodhound
	* ftp
	* secure-delete
	* flameshot
	* bleachbit
	* veil evasion
	* nfs tools
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
	* testssl
	* xfreerdp
	* remmina
	* neo4j
	* bettercap
	* seclists
	* mitmf
	* shellter
	* backdoor-factory
	* responder
	* firmware-mod-kit

[4] Install Git Repos

* This option git clones various useful Git repositorys listed below.
	* https://github.com/0xInfection/TIDoS-Framework
	* https://github.com/RhinoSecurityLabs/pacu
	* https://github.com/m0rtem/CloudFail
	* https://github.com/trustedsec/ridenum
	* https://github.com/pentestmonkey/windows-privesc-check
	* https://github.com/trustedsec/unicorn
	* https://github.com/ICSec/airpwn-ng
	* https://github.com/adaptivethreat/Empire
	* https://github.com/DanMcInerney/wifijammer
	* https://github.com/CoreSecurity/impacket
	* https://github.com/leebaird/discover
	* https://github.com/scrapy/scrapy
	* https://github.com/MobSF/Mobile-Security-Framework-MobSF
	* https://github.com/drwetter/testssl.sh/
	* https://github.com/BishopFox/spoofcheck
	* https://github.com/DanMcInerney/icebreaker
	* https://github.com/hak5darren/wp6
	* https://github.com/superkojiman/onetwopunch
	* https://github.com/nccgroup/chuckle
	* https://github.com/m3m1t1m/appalyzer
	* https://github.com/adipinto/yet-another-nessus-parser
	* https://github.com/OJ/gobuster
	* https://github.com/thelinuxchoice/blackeye
	* https://github.com/securestate/king-phisher
	* https://github.com/shenril/Sitadel
	* https://github.com/khast3x/h8mail
	* https://github.com/aquasecurity/kube-hunter
	* https://github.com/BlackArch/wordlistctl
	* https://github.com/ThoughtfulDev/EagleEye
	* https://github.com/cr4shcod3/pureblood
	* https://github.com/vaguileradiaz/tinfoleak
	* wget https://sec.stanev.org/download/wlc/wlc_0.2.zip
	

[5] Install Oh My ZSH

* Install Oh My Zsh and sets up the Jonathan theme.

![alt text](https://zshthem.es/img/screenshots/jonathan.png)

[6] Install Vbox Additions

* Exactly what it says on the tin, for use with Virtual Box.

[7] Install Wifite Dependencies

* This option installs libcurl4-openssl-dev, libssl-dev, zlib1g-dev, hcxtols and hcxdumptools. All to ensure Wifite operates properly.

[8] Update Git Tools

* Performs a git pull on your tools directory and updates all git repository's at once.

[9] Exit

* You know what this does.

