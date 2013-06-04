class vim {
    package { vim-tiny: ensure => absent }
    package { vim:
        ensure  => latest,
        require => Package["vim-tiny"],
    }
}

class vim::gui {
    package { vim-gtk:
        ensure  => latest,
        require => Package["vim"],
    }
}
