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

[5] Install Oh My ZSH

* Install Oh My Zsh and sets up the Jonathan theme.

[6] Install Vbox Additions

* Exactly what it says on the tin, for use with Virtual Box.

[7] Install Wifite Dependencies

* This option installs libcurl4-openssl-dev, libssl-dev, zlib1g-dev, hcxtols and hcxdumptools. All to ensure Wifite operates properly.

[8] Update Git Tools

* Performs a git pull on your tools directory and updates all git repository's at once.

[9] Exit

* You know what this does.

