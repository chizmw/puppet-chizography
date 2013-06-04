node basenode {

    # all Ubuntu machines get aptitude installed
    case $lsbdistid {
        'Ubuntu': {
            include lsbdist-ubuntu
        }
    }


}

node "default" inherits basenode { }
