class vim {
    package { vim-tiny: ensure => absent }
    package { vim:
        ensure  => latest,
        require => Package["vim-tiny"],
    }
}
