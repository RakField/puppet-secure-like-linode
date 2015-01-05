# Introduction
Module to determine the security settings in Ubuntu and Debian. It is based on Linodes securing your server guide. https://www.linode.com/docs/security/securing-your-server/

It does following: 
Creates user with sudo for administraton tasks and puts rsa key in right place.
Installs openssh-server and change configs(password login is disabled).
Defines basic firewall settings.
Installs fail2ban.

## Affects to these services
•	ssh<br>
•	fail2ban<br>
•	iptables<br>

## Affects to these files (edit or create)
•	/etc/ssh/sshd_config<br>
•	/home/kayttaja/.ssh/authorized_keys<br>
•	/etc/iptables.firewall.rules<br>

## Usage
Works almost from the box. First thing to do is change authorized_keys files content with your own rsa key. To use module it is required to define user and system variables. This can be done in site.pp. 

Example:<br>
	adminuser {’username’:
		usr_pw => ’userpassword’,
	}
	<br>
	Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

## Structure
|-- secure
|   |-- files
|   |   |-- authorized_keys
|   |   |-- iptables.firewall.rules
|   |   `-- sshd_config
|   |-- lib
|   |   `-- puppet
|   |       `-- parser
|   |           `-- functions
|   |               `-- pw_hash.rb
|   `-- manifests
|       |-- fail2ban.pp
|       |-- firewall.pp
|       |-- init.pp
|       `-- ssh.pp

## Sources
pschyska. PW hashing with puppet parser function. URL: https://gist.github.com/pschyska/26002d5f8ee0da2a9ea0
Linode. Securing Your Server. URL: https://www.linode.com/docs/security/securing-your-server Vierailtu: 15.12.2014
