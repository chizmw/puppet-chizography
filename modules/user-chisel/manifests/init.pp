class user-chisel {
    group { "chizography.net":
        ensure => "present",
    }

    user { 'chisel':
        uid => '1000',
        groups => ['admin','chizography.net'],
        comment => 'Chisel',
        home => '/home/chisel',
        ensure => present,
        managehome => false,
    }
}
