class secure::ssh {
        package {"openssh-server":
        ensure => present,
        }

        file {"/etc/ssh/sshd_config":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0600,
        source => "puppet:///modules/secure/sshd_config",
        require => Package['openssh-server'],
        }

        service {"ssh":
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
        subscribe => File['/etc/ssh/sshd_config'],
        }
}

