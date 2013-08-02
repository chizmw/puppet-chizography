class net-chizography {

    # we need a web-server
    require nginx

    # make sure chisel can control it
    include user-chisel

    # make sure /opt/www exists
    require opt-www

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
