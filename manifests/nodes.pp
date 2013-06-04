node basenode {

    # all Ubuntu machines get aptitude installed
    case $lsbdistid {
        'Ubuntu': {
            include lsbdist-ubuntu
        }
    }

    include bash-completion

}

node "default" inherits basenode { }
