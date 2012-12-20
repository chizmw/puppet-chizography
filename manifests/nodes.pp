node basenode {
    include concat::setup

    include build-essential
    include curl
    include elinks
    include git::client
    include libexpat-dev
    include ntp
    include screen
    include ssh::all
    include sudo
    include vim

    case $lsbdistid {
        'LinuxMint': {
            include vim::gui
        }
    }

    # all Ubuntu machines get aptitude installed
    case $lsbdistid {
        'Ubuntu': {
            include aptitude
        }
    }
}

node "appserver" inherits basenode {
    include nginx
}

node "default" inherits basenode { }

node "linode" inherits basenode { }
node "bigv"   inherits basenode { }


node "chisel.pm" inherits appserver { }

# VMs at home
node "chisel-mint.lan" inherits basenode {
    include app-bitlit-todo
    include app-cleavages
    include app-parley
}
node "chisel-mint" inherits "chisel-mint.lan" { }

# can't remember what these are
node "overlord" inherits basenode {
    include app-bitlit-todo
    include presentation-tools
}

node "zergling" inherits basenode {
    include app-bitlit-todo
    include presentation-tools
}
