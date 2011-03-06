class app-cleavages {
    include app-cleavages::db
}

class app-cleavages::db {
    include postgresql

    postgresql::user { "cleavages": }
    postgresql::database { "cleavages": owner => "cleavages" }

    postgresql::hba { "access to database cleavages":
        ensure   => present,
        type     => 'local',
        database => 'cleavages',
        user     => 'cleavages',
        method   => 'trust',
        pgver    => '8.4',
    }  
}
