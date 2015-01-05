class secure::firewall {
        file {"/etc/iptables.firewall.rules":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => 0600,
        source => "puppet:///modules/secure/iptables.firewall.rules",
        }

        exec { "firewall":
        command => "iptables-restore < /etc/iptables.firewall.rules",
        subscribe => File['/etc/iptables.firewall.rules'],
        }
}

