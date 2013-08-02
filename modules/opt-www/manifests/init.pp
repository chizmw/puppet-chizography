class opt-www {

    # we need somewhere for our site(s) to live
    file { "/opt/":
        ensure => "directory",
        owner  => "root",
    }
    file { "/opt/www/":
        ensure => "directory",
        owner  => "root",
    }

}
