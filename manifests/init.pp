# Initial class for vim module

class vim {

    case $::osfamily {
        'Debian': { $pkgs = ['vim', 'vim-tiny'] }
        default: { $pkgs = ['vim-enhanced', 'vim-minimal', 'vim-common'] }
    }

    package{ $pkgs :
        ensure    => present
    }
    
    file{ "dotvimrc":
        path    => '/etc/vimrc',
        source  => 'puppet:///modules/vim/vimrc',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        ensure  => 'present',
        require => Package[$pkgs],
    }

}
