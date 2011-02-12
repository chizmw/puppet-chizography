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
