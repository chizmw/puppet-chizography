class sudo {
    package { sudo: ensure => latest }

    file { "etc_sudoers":
	name	=> "/etc/sudoers",
        owner   => "root",
        group   => "root",
        mode    => 440,
        source  => "puppet:///sudo/sudoers",
        require => Package["sudo"],
    }
}
