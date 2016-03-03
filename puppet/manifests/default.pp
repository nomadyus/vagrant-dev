Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

package { ['vim', 'curl', 'git'] :
	ensure  => 'installed',
	require => Exec['apt-get update'],
}

class system-update {
	exec { 'apt-get update':
		command => 'apt-get update',
	}
	
	$sysPackages = [ "build-essential" ]
	package { $sysPackages:
		ensure => "installed",
		require => Exec['apt-get update'],
	}
}

class apache {
	package { "apache2":
		ensure  => present,
		require => Class["system-update"],
	}

	service { "apache2":
		ensure  => "running",
        enable => true,
		require => Package["apache2"],
	}

}

class php {

	# Install the php5-fpm and php5-cli packages
	package { ['php5-fpm', 'php5-cli', 'libapache2-mod-php5']:
		ensure => present,
		require => Exec['apt-get update'],
	}
	
	# Make sure php5-fpm is running
	service { 'php5-fpm':
		ensure => running,
		require => Package['php5-fpm'],
	}
}

class mysql {
	# Password
	$root_password = 'root'
	
	# Config file path
	$config_path = 'puppet:///modules/mysql/vagrant.cnf'

	# Install mysql
	package { ['mysql-server']:
		ensure => present,
		require => Exec['apt-get update'],
	}
	
	# Run mysql
	service { 'mysql':
		ensure  => running,
		require => Package['mysql-server'],
	}
	
	# Use a custom mysql configuration file
	file { '/etc/mysql/conf.d/vagrant.cnf':
		source  => $config_path,
		require => Package['mysql-server'],
		notify  => Service['mysql'],
	}
	
	# We set the root password here
	exec { 'set-mysql-password':
		unless  => 'mysqladmin -uroot -p${root_password} status',
		command => "mysqladmin -uroot password ${root_password}",
		path    => ['/bin', '/usr/bin'],
		require => Service['mysql'];
	}
}

# Host File (One Level up from vagrant)
file {"/var/www":
	ensure => "link",
	target => "../",   
	require => Package["apache2"],
	notify => Service["apache2"],
	replace => yes,
	force => true,
}

# vhost file for server (enabled sites)
class webserver {
    file { '/etc/apache2/sites-enabled/site.conf':
        source => 'puppet:///modules/vhost/site.conf',
        require => Package["apache2"],
        notify => Service["apache2"]    
    }
}

#includes
include apache
include system-update
include php
include mysql
include webserver
