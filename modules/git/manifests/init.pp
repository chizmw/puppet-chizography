class git::client {
    include bash-completion

    package { git: ensure => latest }
    # part of git on ubuntu
    #package { git-completion: ensure => latest }
}
