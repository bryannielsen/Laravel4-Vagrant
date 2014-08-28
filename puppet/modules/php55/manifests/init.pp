class php55
{

	#PHP 5.5 setup 

	package
	{
		"python-software-properties":
			ensure => present,
			require => Exec['php55 apt update']
	}

	#https://launchpad.net/~ondrej/+archive/php5
	exec 
	{ 
		'add php55 apt-repo':
			command => '/usr/bin/add-apt-repository ppa:ondrej/php5 -y',
			require => [Package['python-software-properties']],
	}

	exec { "php55 apt update":
		command => 'apt-get update',
	}
}
