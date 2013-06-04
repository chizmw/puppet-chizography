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

}

node "default" inherits basenode { }
