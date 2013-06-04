class git::client {
    include bash-completion

    package { git: ensure => latest }
    package { git-completion: ensure => latest }
}
