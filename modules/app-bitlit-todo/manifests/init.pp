class app-bitlit-todo {
    include app-bitlit-todo::db
}

class app-bitlit-todo::db {
    include postgresql

    postgresql::user     { "bitlittodo": password => 'z0mgt0d0' }
    postgresql::database { "bitlittodo": owner => "bitlittodo" }

    postgresql::hba { "access: db=bitlittodo user=bitlittodo type=local":
        ensure   => present,
        type     => 'local',
        database => 'bitlittodo',
        user     => 'bitlittodo',
        method   => 'trust',
        pgver    => '8.4',
    }  
    postgresql::hba { "access: db=bitlittodo user=bitlittodo type=host=127.0.0.1/32":
        ensure   => present,
        type     => 'host',
        address  => '127.0.0.1/32',
        database => 'bitlittodo',
        user     => 'bitlittodo',
        method   => 'trust',
        pgver    => '8.4',
    }  
    postgresql::hba { "access: db=bitlittodo user=bitlittodo type=host=::1/128":
        ensure   => present,
        type     => 'host',
        address  => '::1/128',
        database => 'bitlittodo',
        user     => 'bitlittodo',
        method   => 'trust',
        pgver    => '8.4',
    }  
}
