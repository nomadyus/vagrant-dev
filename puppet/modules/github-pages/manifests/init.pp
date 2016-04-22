class github-pages {
	package {'ruby':
		ensure  => 'installed',
		require => Class['system-update'],
        notify => Exec['install-rvm'],
	}
    
    exec {'gpg-signature':
        command => 'sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3',
        notify => Exec['install-rvm'],
    }
    
    exec {'install-rvm': 
        command => 'sudo curl -L https://get.rvm.io | bash -s stable',
        require => [Package['curl'], Exec['gpg-signature']],
        notify => Exec['update-ruby'],
    }
    
    exec {'update-ruby':
        command => 'sudo rvm install 2.0.0 && sudo rvm --fuzzy alias create default 2.0.0 && sudo rvm use 2.0.0',
        onlyif => 'dpkg -l | grep -c ruby | wc -l',
        #--latest-binary --autolibs=enabled
    }
    
    package {'github-pages':
        ensure => 'installed',
        require => Exec['update-ruby'],
        provider => 'gem',        
    }
}
