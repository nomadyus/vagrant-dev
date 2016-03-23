class vhost { 
    # Setups the virtual host for yusuf.dev
    file { '/etc/apache2/sites-enabled/site.conf':
        source  => 'puppet:///modules/vhost/site.conf',
        notify  => Service['apache2'],
        require => Package['apache2'],
    }
    # Ensure the default host configuration is absent
    file { '/etc/apache2/sites-enabled/default':
        ensure => absent,
        notify => Package['apache2'],
    }
}
