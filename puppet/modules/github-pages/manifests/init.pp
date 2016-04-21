class github-pages {
	package {'ruby1.9.3':
		ensure  => installed,
		require => Class["system-update"],
        notify => Exec['gem install github-pages'],
	}
    exec {'gem install github-pages':
        command => 'gem install github-pages --no-ri --no-rdoc',
        onlyif => 'dpkg -l | grep -c ruby1.9.3 | wc -l',
    }
}
