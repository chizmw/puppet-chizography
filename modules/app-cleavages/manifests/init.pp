class app-cleavages {
    include app-cleavages::db
}

class app-cleavages::db {
    include postgresql
    include postgresql::default::access

    postgresql::user { "cleavages": password => 'cl3avag3s' }
    postgresql::database { "cleavages": owner => "cleavages" }

    postgresql::hba { "access: db=cleavages user=cleavages type=local":
        ensure   => present,
        type     => 'local',
        database => 'cleavages',
        user     => 'cleavages',
        method   => 'trust',
        pgver    => '8.4',
    }  
    postgresql::hba { "access: db=cleavages user=cleavages type=host":
        ensure   => present,
        type     => 'host',
        address  => '127.0.0.1/32',
        database => 'cleavages',
        user     => 'cleavages',
        method   => 'trust',
        pgver    => '8.4',
    }  
}

class postgresql::default::access {
    include postgresql

    postgresql::hba { "access: db=postgres user=all type=local":
        ensure   => 'present',
        type     => 'local',
        database => 'postgres',
        user     => 'all',
        method   => 'trust',
        pgver    => '8.4',
    }  

    postgresql::hba { "revoke access: db=all user=all type=local":
        ensure   => 'absent',
        type     => 'local',
        database => 'all',
        user     => 'all',
        method   => 'ident',
        pgver    => '8.4',
    }  

    postgresql::hba { "revoke access: db=all user=all type=host=127.0.0.1/32":
        ensure   => 'absent',
        type     => 'host',
        address  => '127.0.0.1/32',
        database => 'all',
        user     => 'all',
        method   => 'md5',
        pgver    => '8.4',
    }  

    postgresql::hba { "revoke access: db=all user=all type=host=::1/128":
        ensure   => 'absent',
        type     => 'host',
        address  => '::1/128',
        database => 'all',
        user     => 'all',
        method   => 'md5',
        pgver    => '8.4',
    }  
}
