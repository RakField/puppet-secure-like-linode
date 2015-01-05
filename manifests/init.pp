class secure {
  include secure::ssh, secure::firewall, secure::fail2ban

  define adminuser ($usr_name=$title, $usr_pw, $salt = '6') {
        user {$usr_name:
        ensure => present,
        password => pw_hash($usr_pw, $salt),
        gid => $usr_name,
        shell => '/bin/bash',
        home => "/home/${usr_name}",
        managehome => true,
        }

        group {$usr_name:
        ensure  => present,
        }

	exec { "sudo":
        command => "usermod -a -G sudo ${usr_name}",
        require => User[$usr_name],
        }

        file { "/home/${usr_name}/.ssh":
        ensure => "directory",
        owner  => $usr_name,
        group  => $usr_name,
        mode   => 700,
        require => User[$usr_name],
        }

        file {"/home/${usr_name}/.ssh/authorized_keys":
        ensure => present,
        owner => $usr_name,
        group => $usr_name,
        mode => 0600,
        source => "puppet:///modules/secure/authorized_keys",
        require => File["/home/${usr_name}/.ssh"],
        }
 }
}

