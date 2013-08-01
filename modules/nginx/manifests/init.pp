class nginx {
    package { nginx: ensure => latest }

    # we need to make the site config 'available'
    file { "/etc/nginx/nginx.conf":
        source => [
            "puppet:///modules/nginx/nginx.conf"
        ],
        notify => Service["nginx"],
    }

    service { "nginx":
        ensure  => "running",
        enable  => "true",
        require => Package["nginx"],
    }
}
