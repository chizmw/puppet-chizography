class user-kristaleksa {
    group { "kristaleksa":
        ensure => "present",
    }

    user { 'kristaleksa':
        uid => '5001',
        gid => "kristaleksa",
        groups => ["staff"],
        comment => 'Kristina',
        home => '/home/kristaleksa',
        ensure => present,
        managehome => false,
        require => Group["kristaleksa"],
        membership => minimum,
    }
}
