class user-tubehopper {
    group { "tubehopper":
        ensure => "present",
    }

    user { 'tubehopper':
        uid => '5000',
        gid => "tubehopper",
        groups => ["staff"],
        comment => 'TubeHopper',
        home => '/home/tubehopper',
        ensure => present,
        managehome => false,
        require => Group["tubehopper"],
        membership => minimum,
    }
}
