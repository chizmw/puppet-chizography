node basenode {

    # all Ubuntu machines get aptitude installed
    case $lsbdistid {
        'Ubuntu': {
            include lsbdist-ubuntu
        }
    }

    include bash-completion
    include build-essential
    include curl
    include elinks
    include git::client
    include libexpat-dev
    include libssl-dev
    include ntp
    include screen
    include ssh::all
    include sudo
    include vim

}

node "default" inherits basenode { }
