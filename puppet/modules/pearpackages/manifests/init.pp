class pearpackages {
	exec {"pear upgrade":
	  command => "/usr/bin/pear upgrade",
	  require => Package['php-pear'],
	  returns => [ 0, '', ' ']
	}

	# set channels to auto discover
	exec { "pear auto_discover" :
	  command => "/usr/bin/pear config-set auto_discover 1",
	  require => [Package['php-pear']]
	}

	exec { "pear update-channels" :
	  command => "/usr/bin/pear update-channels",
	  require => [Package['php-pear']]
	}

	exec {"pear install phpunit":
	  command => "/usr/bin/pear install --alldeps pear.phpunit.de/PHPUnit",
	  creates => '/usr/bin/phpunit',
	  require => Exec['pear update-channels']
	}

	# install phploc
	exec {"pear install phploc":
	  command => "/usr/bin/pear install --alldeps pear.phpunit.de/phploc",
	  creates => '/usr/bin/phploc',
	  require => Exec['pear update-channels']
	}

	# install phpcpd
	exec {"pear install phpcpd":
	  command => "/usr/bin/pear install --alldeps pear.phpunit.de/phpcpd",
	  creates => '/usr/bin/phpcpd',
	  require => Exec['pear update-channels']
	}

	# install phpdcd
	exec {"pear install phpdcd":
	  command => "/usr/bin/pear install --alldeps pear.phpunit.de/phpdcd-beta",
	  creates => '/usr/bin/phpdcd',
	  require => Exec['pear update-channels']
	}

	# install phpcs
	exec {"pear install phpcs":
	  command => "/usr/bin/pear install --alldeps PHP_CodeSniffer",
	  creates => '/usr/bin/phpcs',
	  require => Exec['pear update-channels']
	}

	# install phpdepend
	exec {"pear install pdepend":
	  command => "/usr/bin/pear install --alldeps pear.pdepend.org/PHP_Depend-beta",
	  creates => '/usr/bin/pdepend',
	  require => Exec['pear update-channels']
	}

	# install phpmd
	exec {"pear install phpmd":
	  command => "/usr/bin/pear install --alldeps pear.phpmd.org/PHP_PMD",
	  creates => '/usr/bin/phpmd',
	  require => Exec['pear update-channels']
	}

	# install PHP_CodeBrowser
	exec {"pear install PHP_CodeBrowser":
	  command => "/usr/bin/pear install --alldeps pear.phpqatools.org/PHP_CodeBrowser",
	  creates => '/usr/bin/phpcb',
	  require => Exec['pear update-channels']
	}
}