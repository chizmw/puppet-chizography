node basenode {

    # all Ubuntu machines get aptitude installed
    case $lsbdistid {
        'Ubuntu': {
            include lsbdist-ubuntu
        }
    }

    include apache2-utils
    include bash-completion
    include build-essential
    include curl
    include elinks
    include git::client
    include libexpat-dev
    include libssl-dev
    include ntp
    include puppet-lint
    include screen
    include ssh::all
    include sudo
    include vim

}

node "default" inherits basenode { }

node "droplet" inherits basenode {
    # droplet is 'chizography.net'
    include net-chizography
    include net-chizography-tubehopper
    include net-kristaleksa
}
