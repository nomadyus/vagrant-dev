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