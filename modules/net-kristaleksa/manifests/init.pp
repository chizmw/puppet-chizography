class net-kristaleksa {

    # we need a web-server
    require nginx

    # make sure chisel can control it
    require user-kristaleksa

    # make sure /opt/www exists
    require opt-www

    file { "/opt/www/kristaleksa.net":
        ensure => "directory",
        owner  => "root",
        group  => "kristaleksa",
        mode   => 2770,
    }

    # we need to make the site config 'available'
    file { "/etc/nginx/sites-available/kristaleksa.net":
        source => [
            "puppet:///modules/net-kristaleksa/nginx.conf-kristaleksa"
        ],
    }

    file { '/etc/nginx/sites-enabled/kristaleksa.net':
       ensure => 'link',
       target => '/etc/nginx/sites-available/kristaleksa.net',
    }
}
