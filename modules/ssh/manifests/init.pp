class ssh::all {
    include ssh::client
    include ssh::server
}

class ssh::client {
    package { openssh-client: ensure => latest }
}

class ssh::server {
    package { openssh-server: ensure => latest }

    service { ssh:
        ensure  => running,
        require => Package["openssh-server"],
    }
}

class ssh::env_keep {
    # factor this out somewhere more sensible
    $sudoers = '/etc/sudoers'
    concat{"/etc/sudoers": require => Package['sudo']}
    concat::fragment{"sudoer_env_keep_ssh_auth":
        target 	=> $sudoers,
        content => "Defaults env_keep+=\"SSH_AUTH_SOCK\"\n",
        order   => 01,
    }
}
