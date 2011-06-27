node basenode {
    include concat::setup

    include build-essential
    include curl
    include elinks
    include git::client
    include ssh::all
    include sudo
    include vim

    case $lsbdistid {
        'LinuxMint': {
            include vim::gui
        }
    }
}

node "default" inherits basenode { }

node "chisel-mint.lan" inherits basenode {
    include app-cleavages
    include app-parley

}