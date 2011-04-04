class app-parley {
    include app-parley::db
}

class app-parley::db {
    include postgresql

    postgresql::user { "parley": password => 'chitchat' }
    postgresql::database { "parley": owner => "parley" }

    postgresql::hba { "access to database parley":
        ensure   => present,
        type     => 'local',
        database => 'parley',
        user     => 'parley',
        method   => 'trust',
        pgver    => '8.4',
    }  
}
