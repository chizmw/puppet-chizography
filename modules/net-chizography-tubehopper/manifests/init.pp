class net-chizography-tubehopper {

    # we need a web-server
    require nginx

    # make sure chisel can control it
    require user-tubehopper

    # make sure /opt/www exists
    require opt-www

    file { "/opt/www/tubehopper.chizography.net":
        ensure => "directory",
        owner  => "root",
        group  => "tubehopper",
        mode   => 2770,
    }

    # we need to make the site config 'available'
    file { "/etc/nginx/sites-available/tubehopper.chizography.net":
        source => [
            "puppet:///modules/net-chizography-tubehopper/nginx.conf-tubehopper"
        ],
    }

    file { '/etc/nginx/sites-enabled/tubehopper.chizography.net':
       ensure => 'link',
       target => '/etc/nginx/sites-available/tubehopper.chizography.net',
    }
}
