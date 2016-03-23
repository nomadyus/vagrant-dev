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
		require => Service['mysql'],
	}
}