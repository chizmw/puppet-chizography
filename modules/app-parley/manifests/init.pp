class app-parley {
    include app-parley::db
}

class app-parley::db {
    include postgresql

    postgresql::user { "parley": password => 'chitchat' }
    postgresql::database { "parley": owner => "parley" }

    postgresql::hba { "access: db=parley user=parley type=local":
        ensure   => present,
        type     => 'local',
        database => 'parley',
        user     => 'parley',
        method   => 'trust',
        pgver    => '8.4',
    }  
    postgresql::hba { "access: db=parley user=parley type=host=127.0.0.1/32":
        ensure   => present,
        type     => 'host',
        address  => '127.0.0.1/32',
        database => 'parley',
        user     => 'parley',
        method   => 'trust',
        pgver    => '8.4',
    }  
    postgresql::hba { "access: db=parley user=parley type=host=::1/128":
        ensure   => present,
        type     => 'host',
        address  => '::1/128',
        database => 'parley',
        user     => 'parley',
        method   => 'trust',
        pgver    => '8.4',
    }  
}
