class laravel_app
{

	package { 'git-core':
    	ensure => present,
    }

   	exec { 'install composer':
	    command => 'curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin',
	    require => Package['php5-cli'],
	    unless => "[ -f /usr/local/bin/composer ]"
	}

	exec { 'global composer':
		command => "sudo mv /usr/local/bin/composer.phar /usr/local/bin/composer",
		require => Exec['install composer'],
		unless => "[ -f /usr/local/bin/composer ]"
	}

	# Check to see if there's a composer.json and app directory before we delete everything
	# We need to clean the directory in case a .DS_STORE file or other junk pops up before
	# the composer create-project is called
	exec { 'clean www directory':
		command => "/bin/sh -c 'cd /var/www && find -mindepth 1 -delete'",
		unless => [ "test -f /var/www/composer.json", "test -d /var/www/app" ],
		require => Package['apache2']
	}

	exec { 'setup laravel installer':
		command => "/bin/sh -c 'wget http://laravel.com/laravel.phar && chmod +x laravel.phar && mv laravel.phar /usr/local/bin/laravel'",
		creates => [ "/usr/local/bin/laravel"],
		timeout => 900
	}


	exec { 'create laravel project':
		command => "/bin/sh -c 'cd /var/www/ && laravel new temp && mv temp/* . && rm -rf temp'",
		require => [Exec['setup laravel installer'], Package['php5'], Package['git-core']], #Exec['clean www directory']
		creates => "/var/www/composer.json",
		timeout => 1800,
		logoutput => true
	}

	exec { 'update packages':
        command => "/bin/sh -c 'cd /var/www/ && composer --verbose --prefer-dist update'",
        require => [Package['git-core'], Package['php5'], Exec['global composer']],
        onlyif => [ "test -f /var/www/composer.json", "test -d /var/www/vendor" ],
        timeout => 900,
        logoutput => true
	}

	exec { 'install packages':
        command => "/bin/sh -c 'cd /var/www/ && composer install'",
        require => Package['git-core'],
        onlyif => [ "test -f /var/www/composer.json" ],
        creates => "/var/www/vendor/autoload.php",
        timeout => 900,
	}


	file { '/var/www/app/storage':
		mode => 0777
	}
}
