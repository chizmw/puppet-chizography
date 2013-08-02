class user-www-data {

    group { "chizography.net":
        ensure => "present",
    }

    group { "www-data":
        ensure => "present",
    }

    user { 'www-data':
        uid => '33',
        groups => ['admin','www-data','chizography.net'],
        comment => 'Chisel',
        home => '/var/www',
        ensure => present,
        managehome => false,
    }
}
