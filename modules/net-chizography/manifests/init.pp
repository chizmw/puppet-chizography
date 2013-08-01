class net-chizography {

    # we need a web-server
    require nginx

    # make sure chisel can control it
    include user-chisel

    # we need somewhere for our site to live
    file { "/opt/":
        ensure => "directory",
        owner  => "root",
    }
    file { "/opt/www/":
        ensure => "directory",
        owner  => "root",
    }
    file { "/opt/www/chizography.net":
        ensure => "directory",
        owner  => "root",
        group  => "chizography.net",
        mode   => 2770,
    }

    # we need to make the site config 'available'
    file { "/etc/nginx/sites-available/chizography.net":
        source => [
            "puppet:///modules/net-chizography/nginx.conf-chizography.net"
        ],
	#notify => Service["nginx"],
    }

    file { '/etc/nginx/sites-enabled/chizography.net':
       ensure => 'link',
       target => '/etc/nginx/sites-available/chizography.net',
    }
}
