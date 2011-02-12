node basenode {
    include "sudo"
    include "git::client"
    include "vim"
    include "build-essential"
}

node "default" inherits basenode { }
