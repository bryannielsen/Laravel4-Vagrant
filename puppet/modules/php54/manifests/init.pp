class php54 
{

	#PHP 5.4 setup 

	package
	{
		"python-software-properties":
			ensure => present,
			require => Exec['php54 apt update']
	}

	#https://launchpad.net/~ondrej/+archive/php5
	exec 
	{ 
		'add php54 apt-repo':
			command => '/usr/bin/add-apt-repository ppa:ondrej/php5-oldstable -y',
			require => [Package['python-software-properties'], Exec['remove old php5 repo']],
	}

	# This section handles removing the old ondrej/php5 ppa which updated to 5.5

	exec { "remove old php5 repo":
		#command => "/usr/bin/add-apt-repository --remove ppa:ondrej/php5 -y",
		command => "rm /etc/apt/sources.list.d/ondrej-php5-precise.*",
		onlyif => [ "test -f /etc/apt/sources.list.d/ondrej-php5-precise.list" ],
		require => [Package['python-software-properties'], Exec["remove php5 packages"]],
	}

	exec { "remove php5 packages":
		command => "/bin/sh -c 'export DEBIAN_FRONTEND=noninteractive' && sudo apt-get remove php5 php5-cli php5-common php5-mysql apache2 phpmyadmin -y -qq && sudo apt-get autoremove -y",
		onlyif => [ "test -f /etc/apt/sources.list.d/ondrej-php5-precise.list" ],
		require => Exec["purge apache"],
	}

	# Apache may have tried updating to 2.4 for php 5.5 dependency so we need to purge
	exec { "purge apache":
		command => "sudo apt-get remove --purge apache2* -y && sudo apt-get autoremove -y",
		onlyif => [ "test -f /etc/apt/sources.list.d/ondrej-php5-precise.list" ],
	}

	exec { "php54 apt update":
		command => 'apt-get update',
	}
}
