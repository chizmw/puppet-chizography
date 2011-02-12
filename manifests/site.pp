node basenode {
    include "build-essential"
    include "git::client"
    include "ssh::all"
    include "sudo"
    include "vim"
}

node "default" inherits basenode { }
