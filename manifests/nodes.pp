node basenode {

    # all Ubuntu machines get aptitude installed
    case $lsbdistid {
        'Ubuntu': {
            include lsbdist-ubuntu
        }
    }

    include bash-completion
    include ntp
    include screen
    include ssh::all
    include sudo
    include vim

}

node "default" inherits basenode { }
